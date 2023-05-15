import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_response.freezed.dart';
part 'delivery_response.g.dart';

@freezed
class DeliveryResponse with _$DeliveryResponse {
  const factory DeliveryResponse({
    required String url,
  }) = _DeliveryResponse;

  factory DeliveryResponse.fromJson(Map<String, dynamic> json) => _$DeliveryResponseFromJson(json);
}
