// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names
part of 'delivery_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeliveryRequest _$$_DeliveryRequestFromJson(Map<String, dynamic> json) => _$_DeliveryRequest(
      modelSpeed: json['model_speed'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      zipcode: json['zipcode'] as String,
      factors: (json['factors'] as List<dynamic>).map((e) => NameAmount.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_DeliveryRequestToJson(_$_DeliveryRequest instance) => <String, dynamic>{
      'model_speed': instance.modelSpeed,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'zipcode': instance.zipcode,
      'factors': instance.factors,
    };
