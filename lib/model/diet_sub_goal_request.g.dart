// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'diet_sub_goal_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DietSubGoalRequest _$$_DietSubGoalRequestFromJson(Map<String, dynamic> json) => _$_DietSubGoalRequest(
      modelSpeed: json['model_speed'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      factors: (json['factors'] as List<dynamic>).map((e) => NameAmount.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_DietSubGoalRequestToJson(_$_DietSubGoalRequest instance) => <String, dynamic>{
      'model_speed': instance.modelSpeed,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'factors': instance.factors,
    };
