import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/model/name_amount.dart';
import 'package:prometh_ai/model/recipe_request.dart';
import 'package:prometh_ai/model/recipe_response.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/session_id.dart';
import 'package:prometh_ai/state/user_id.dart';

import 'api.dart';

CancelToken? _token;

final recipeAPI = FutureProvider.autoDispose.family<RecipeResponse, List<NameAmount>>((ref, factors) async {
  final payload = RecipeRequest(
    userId: ref.read(UserIdNotifier.provider)!,
    sessionId: ref.read(sessionId)!,
    factors: factors,
  );
  _token?.cancel();
  _token = CancelToken();

  try {
    final result = await ref.read(dio).safePost(
          '/recipe-request',
          RecipeResponse.fromJson,
          cancelToken: _token,
          data: {'payload': payload.toJson()},
          ref: ref,
        );

    return result;
  } on Exception catch (e) {
    ref.read(ErrorNotifier.provider.notifier).store(e.toString());
    rethrow;
  }
});
