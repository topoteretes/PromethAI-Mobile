// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'prompt_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromptUpdateRequest _$$_PromptUpdateRequestFromJson(Map<String, dynamic> json) => _$_PromptUpdateRequest(
      modelSpeed: json['model_speed'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      category: json['category'] as String,
      from: json['from'] as String,
      to: json['to'] as String,
    );

Map<String, dynamic> _$$_PromptUpdateRequestToJson(_$_PromptUpdateRequest instance) => <String, dynamic>{
      'model_speed': instance.modelSpeed,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'category': instance.category,
      'from': instance.from,
      'to': instance.to,
    };
