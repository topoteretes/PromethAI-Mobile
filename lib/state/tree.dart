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
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/top_category.dart';

import 'mode_speed.dart';
import 'path.dart';
import 'prompt.dart';
import 'session_id.dart';
import 'user_id.dart';

CancelToken? _token;

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

  refresh({String promptMaybe = ""}) async {
    final topCategoryNotifier = ref.read(TopCategoryNotifier.provider.notifier);
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);
    final categoryFetchedNotifier = ref.read(CategoryFetchedNotifier.provider.notifier);

    final currentPrompt = ref.read(PromptNotifier.provider);
    final prompt = promptMaybe.isBlank ? currentPrompt : promptMaybe.trim();
    if (prompt == currentPrompt) {
      return;
    }

    categoryFetchedNotifier.reset();
    promptNotifier.store(prompt);
    state = [];

    final payload = PromptDecomposeRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      prompt: prompt,
    );
    _token?.cancel();
    _token = CancelToken();

    try {
      final response = await ref.read(dio).safePost(
            '/prompt-to-choose-meal-tree',
            PromptResponse.fromJson,
            cancelToken: _token,
            data: {'payload': payload.toJson()},
            ref: ref,
          );
      state = response.results;
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
    _token?.cancel();
    _token = CancelToken();

    try {
      final response = await ref.read(dio).safePost(
            '/prompt-to-decompose-meal-tree-categories',
            PromptResponse.fromJson,
            cancelToken: _token,
            data: {'payload': payload.toJson()},
            ref: ref,
          );

      state = response.results;
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

    final updatedPreference =
        selectedTree.preference.contains(preference) && selectedTree.category != topCategory ? <String>[] : [preference];
    final tree = topTree.updateSubTree(path, selectedTree.copyWith(preference: updatedPreference));
    final from = selectedTree.preference.firstOrNull ?? selectedTree.category;

    promptNotifier.rewrite(from, preference);
    state = state.mapp((e) => e.category == topCategory ? tree : e);
  }
}
