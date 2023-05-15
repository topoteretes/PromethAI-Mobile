import 'package:freezed_annotation/freezed_annotation.dart';

import 'name_amount.dart';

part 'delivery_request.freezed.dart';

part 'delivery_request.g.dart';

@freezed
class DeliveryRequest with _$DeliveryRequest {
  const factory DeliveryRequest(
      {@JsonKey(name: "model_speed") required String modelSpeed,
      @JsonKey(name: 'user_id') required String userId,
      @JsonKey(name: 'session_id') required String sessionId,
      required String zipcode,
      required List<NameAmount> factors}) = _DeliveryRequest;

  factory DeliveryRequest.fromJson(Map<String, dynamic> json) => _$DeliveryRequestFromJson(json);
}
