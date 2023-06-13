import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/api.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/model/correct_prompt_request.dart';
import 'package:prometh_ai/model/correct_prompt_response.dart';
import 'package:prometh_ai/model/prompt.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/mode_speed.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/utils/logger.dart';

import 'path.dart';
import 'session_id.dart';
import 'top_category.dart';
import 'user_id.dart';

CancelToken? _token;

class PromptNotifier extends StateNotifier<Prompt> {
  final Ref ref;
  static final provider = StateNotifierProvider<PromptNotifier, Prompt>(PromptNotifier.new);

  PromptNotifier(this.ref) : super((const Prompt(original: "", current: "", updating: false, originalMap: {})));

  reset(String newPrompt) => state = Prompt(original: newPrompt, current: newPrompt, updating: false, originalMap: {});

  storeMap(Map<String, String> map) => state = state.copyWith(originalMap: map);

  rewrite() async {
    final allPath = ref.read(PathNotifier.provider);
    final trees = ref.read(TreeNotifier.provider);

    // Start with the original prompt
    var rawPrompt = state.original.toLowerCase();

    // Find every leaf in all categories and rewrite
    for (final t in trees) {
      final category = t.category;
      final path = allPath[category] ?? [];
      final selectedTree = t.getLeaf(path);
      final from = state.originalMap[category]!.toLowerCase();
      final to = selectedTree.preference.first.toLowerCase();

      rawPrompt = rawPrompt.replaceAll(from, to);
    }

    state = state.copyWith(updating: true);

    final payload = CorrectPromptRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      prompt: rawPrompt,
    );

    try {
      final response = await ref.read(dio).safePost(
            '/correct-prompt-grammar',
            CorrectPromptResponse.fromJson,
            cancelToken: _token,
            data: {'payload': payload.toJson()},
            ref: ref,
          );

      state = state.copyWith(current: response.result);
    } on Exception catch (e) {
      ref.read(ErrorNotifier.provider.notifier).store(e.toString());
      rethrow;
    }

    state = state.copyWith(updating: false);
  }
}
