import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/model/delivery_request.dart';
import 'package:prometh_ai/model/delivery_response.dart';
import 'package:prometh_ai/model/name_amount.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/session_id.dart';

import 'api.dart';
import '../state/mode_speed.dart';
import '../state/user_id.dart';

CancelToken? _token;

final deliveryAPI = FutureProvider.autoDispose.family<DeliveryResponse, List<NameAmount>>((ref, factors) async {
  final payload = DeliveryRequest(
    userId: ref.read(UserIdNotifier.provider),
    sessionId: ref.read(sessionId)!,
    modelSpeed: ref.read(modelSpeed),
    factors: factors,
    // TODO: find out zipcode
    zipcode: '10317',
  );
  _token?.cancel();
  _token = CancelToken();

  try {
    final result = await ref.watch(dio).safePost(
          '/delivery-request',
          DeliveryResponse.fromJson,
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
