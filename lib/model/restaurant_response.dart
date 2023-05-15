import 'package:freezed_annotation/freezed_annotation.dart';

import 'restaurant.dart';

part 'restaurant_response.freezed.dart';
part 'restaurant_response.g.dart';

@freezed
class RestaurantResponse with _$RestaurantResponse {
  const factory RestaurantResponse({
    required List<Restaurant> restaurants,
  }) = _RestaurantResponse;

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) => _$RestaurantResponseFromJson(json);
}
