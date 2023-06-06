import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/api.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/ext/string_ext.dart';
import 'package:prometh_ai/model/prompt_choose_request.dart';
import 'package:prometh_ai/model/prompt_response.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/top_category.dart';

import 'mode_speed.dart';
import 'path.dart';
import 'session_id.dart';
import 'user_id.dart';

CancelToken? _token;

class PromptNotifier extends StateNotifier<PromptResponse> {
  final Ref ref;
  static final provider = StateNotifierProvider<PromptNotifier, PromptResponse>(PromptNotifier.new);

  PromptNotifier(this.ref) : super(const PromptResponse(prompt: "", tree: []));

  refresh({String promptMaybe = ""}) async {
    final topCategoryNotifier = ref.read(TopCategoryNotifier.provider.notifier);
    final prompt = promptMaybe.isBlank ? state.prompt : promptMaybe.trim();
    if (prompt == state.prompt) {
      return;
    }
    state = PromptResponse(prompt: prompt, tree: []);

    final payload = PromptChooseRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      prompt: prompt,
    );
    _token?.cancel();
    _token = CancelToken();

    try {
      await Future.delayed(const Duration(seconds: 10));
      state = await ref.read(dio).safePost(
            '/prompt-to-choose-meal-tree',
            PromptResponse.fromJson,
            cancelToken: _token,
            data: {'payload': payload.toJson()},
            ref: ref,
          );

      topCategoryNotifier.update(state.tree.first.category);
    } on Exception catch (e) {
      ref.read(ErrorNotifier.provider.notifier).store(e.toString());
      rethrow;
    }
  }

  togglePreference(Tree selectedTree, String preference) {
    final topCategory = ref.read(TopCategoryNotifier.provider);
    final allPath = ref.read(PathNotifier.provider);
    final path = allPath[topCategory] ?? [];
    final topTree = state.tree.firstWhere((t) => t.category == topCategory);

    final updatedPreference =
        selectedTree.preference.contains(preference) && selectedTree.category != topCategory ? <String>[] : [preference];
    final tree = topTree.updateSubTree(path, selectedTree.copyWith(preference: updatedPreference));
    final from = selectedTree.preference.firstOrNull ?? selectedTree.category;
    final prompt = state.prompt.replaceAll(from, preference);
    state = state.copyWith(tree: state.tree.mapp((e) => e.category == topCategory ? tree : e), prompt: prompt);
  }
}
