// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'restaurant_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RestaurantResponse _$$_RestaurantResponseFromJson(Map<String, dynamic> json) => _$_RestaurantResponse(
      restaurants: (json['restaurants'] as List<dynamic>).map((e) => Restaurant.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_RestaurantResponseToJson(_$_RestaurantResponse instance) => <String, dynamic>{
      'restaurants': instance.restaurants,
    };
