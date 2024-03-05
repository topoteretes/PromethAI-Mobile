import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/api.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/model/recipe_request.dart';
import 'package:prometh_ai/model/recipe_title_response.dart';
import 'package:prometh_ai/state/access_token.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/recipe_title.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/utils/logger.dart';

import 'mode_speed.dart';
import 'session_id.dart';

CancelToken? _token;

class LastRecipeNotifier extends StateNotifier<String?> {
  final Ref ref;
  static final provider = StateNotifierProvider<LastRecipeNotifier, String?>(LastRecipeNotifier.new);

  LastRecipeNotifier(this.ref) : super(null);

  refresh(String prompt) async {
    final recipeTitleCache = ref.read(RecipeTitleNotifier.provider);

    if (recipeTitleCache.containsKey(prompt)) {
      final cacheHit = recipeTitleCache[prompt]!;
      state = cacheHit;
      return;
    }

    state = null;

    final payload = RecipeRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      prompt: prompt,
    );

    _token?.cancel();
    _token = CancelToken();

    try {
      final response = await ref.read(dio).safePost(
            '/food/solution-name-request',
            RecipeTitleResponse.fromJson,
            options: ref.read(accessToken),
            data: {'payload': payload.toJson()},
            cancelToken: _token,
            ref: ref,
            rawResponse: true,
          );

      final title = response.response;

      final recipeTitleNotifier = ref.read(RecipeTitleNotifier.provider.notifier);
      recipeTitleNotifier.store(prompt, title);
      state = title;
    } catch (e) {
      ref.read(ErrorNotifier.provider.notifier).store(e.toString());
      rethrow;
    }
  }

  reset() => state = null;
}
