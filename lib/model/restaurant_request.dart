import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/name_amount.dart';

part 'restaurant_request.freezed.dart';
part 'restaurant_request.g.dart';

@freezed
class RestaurantRequest with _$RestaurantRequest {
  const factory RestaurantRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    required List<NameAmount> factors,
  }) = _RestaurantRequest;

  factory RestaurantRequest.fromJson(Map<String, dynamic> json) => _$RestaurantRequestFromJson(json);
}
