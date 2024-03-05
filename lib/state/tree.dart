import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/api.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/ext/string_ext.dart';
import 'package:prometh_ai/model/prompt_category_request.dart';
import 'package:prometh_ai/model/prompt_decompose_request.dart';
import 'package:prometh_ai/model/prompt_response.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/access_token.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/top_category.dart';

import 'mode_speed.dart';
import 'path.dart';
import 'prompt.dart';
import 'session_id.dart';
import 'user_id.dart';

CancelToken? _decomposeToken;
CancelToken? _categoryToken;

final selectedTree = Provider((ref) {
  final topCategory = ref.watch(TopCategoryNotifier.provider);
  final tree = ref.watch(TreeNotifier.provider);
  return tree.firstWhereOrNull((t) => t.category == topCategory);
});

class CategoryFetchedNotifier extends StateNotifier<bool> {
  final Ref ref;
  static final provider = StateNotifierProvider<CategoryFetchedNotifier, bool>(CategoryFetchedNotifier.new);

  CategoryFetchedNotifier(this.ref) : super(false);

  reset() => state = false;
  done() => state = true;
}

class TreeNotifier extends StateNotifier<List<Tree>> {
  final Ref ref;
  static final provider = StateNotifierProvider<TreeNotifier, List<Tree>>(TreeNotifier.new);

  TreeNotifier(this.ref) : super([]);

  refresh({String promptMaybe = "", bool userDefaults = true}) async {
    final topCategoryNotifier = ref.read(TopCategoryNotifier.provider.notifier);
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);
    final categoryFetchedNotifier = ref.read(CategoryFetchedNotifier.provider.notifier);

    final currentPrompt = ref.read(PromptNotifier.provider);
    final prompt = promptMaybe.isBlank ? currentPrompt.current : promptMaybe.trim();
    if (prompt == currentPrompt.current && state.isNotEmpty) {
      return;
    }

    categoryFetchedNotifier.reset();
    promptNotifier.reset(prompt);
    state = [];

    final payload = PromptDecomposeRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      prompt: prompt,
      userDefaults: userDefaults ? "True" : "False",
    );
    _decomposeToken?.cancel();
    _decomposeToken = CancelToken();

    try {
      final response = await ref.read(dio).safePost(
            '/prompt-to-choose-meal-tree',
            PromptResponse.fromJson,
            cancelToken: _decomposeToken,
            options: ref.read(accessToken),
            data: {'payload': payload.toJson()},
            ref: ref,
          );
      state = response.results;

      final originalMap = {for (var e in state) e.category: e.preference.first.replaceAll("_", " ")};
      promptNotifier.storeMap(originalMap);
      topCategoryNotifier.update(state.first.category);
      await getCategories();
      categoryFetchedNotifier.done();
    } on Exception catch (e) {
      ref.read(ErrorNotifier.provider.notifier).store(e.toString());
      rethrow;
    }
  }

  getCategories() async {
    final promptStruct = state.map((e) => "${e.category}=${e.preference.first}").join(";");
    final payload = PromptCategoryRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      promptStruct: promptStruct,
    );
    _categoryToken?.cancel();
    _categoryToken = CancelToken();

    try {
      final response = await ref.read(dio).safePost(
            '/prompt-to-decompose-meal-tree-categories',
            PromptResponse.fromJson,
            cancelToken: _categoryToken,
            options: ref.read(accessToken),
            data: {'payload': payload.toJson()},
            ref: ref,
          );

      final existingTopCategories = state.mapp((e) => e.category);

      // filter out suggestions not within the decision points
      final newTrees = response.results.where((e) => existingTopCategories.contains(e.category));

      // merge new results with tree root, keeping the original option at the top
      state = state.mapp((e) {
        final newTree = newTrees.firstWhereOrNull((f) => f.category == e.category);
        final newOptions = newTree?.options ?? [];
        return e.copyWith(options: newOptions, preference: [...e.preference]);
      });
    } on Exception catch (e) {
      ref.read(ErrorNotifier.provider.notifier).store(e.toString());
      rethrow;
    }
  }

  togglePreference(Tree selectedTree, String preference) {
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);
    final topCategory = ref.read(TopCategoryNotifier.provider);
    final allPath = ref.read(PathNotifier.provider);

    final path = allPath[topCategory] ?? [];
    final topTree = state.firstWhere((t) => t.category == topCategory);

    final alreadyContains = selectedTree.preference.contains(preference);
    // Can't deselect toplevel if only one seletion is in place
    if (alreadyContains && selectedTree.preference.length == 1 && path.isEmpty) {
      return;
    }
    final updatedPreference =
        alreadyContains ? [...selectedTree.preference.whereNot((e) => e == preference)] : [...selectedTree.preference, preference];

    final tree = topTree.updateSubTree(
        path,
        selectedTree.copyWith(preference: [
          ...{...updatedPreference}
        ]));

    state = state.mapp((e) => e.category == topCategory ? tree : e);
    promptNotifier.rewrite();
  }

  cleanup() => state = [];
}
