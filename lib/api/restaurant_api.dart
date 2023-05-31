import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/model/name_amount.dart';
import 'package:prometh_ai/model/restaurant_request.dart';
import 'package:prometh_ai/model/restaurant_response.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/mode_speed.dart';
import 'package:prometh_ai/state/session_id.dart';
import 'package:prometh_ai/state/user_id.dart';

import 'api.dart';

CancelToken? _token;

final restaurantAPI = FutureProvider.autoDispose.family<RestaurantResponse, List<NameAmount>>((ref, factors) async {
  final payload = RestaurantRequest(
    userId: ref.read(UserIdNotifier.provider)!,
    sessionId: ref.read(sessionId)!,
    modelSpeed: ref.read(modelSpeed),
    factors: factors,
  );
  _token?.cancel();
  _token = CancelToken();

  try {
    final result = await ref.read(dio).safePost(
          '/restaurant-request',
          RestaurantResponse.fromJson,
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
