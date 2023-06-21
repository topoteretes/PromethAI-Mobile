// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'correct_prompt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CorrectPromptRequest _$$_CorrectPromptRequestFromJson(Map<String, dynamic> json) => _$_CorrectPromptRequest(
      modelSpeed: json['model_speed'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      prompt: json['prompt_source'] as String,
    );

Map<String, dynamic> _$$_CorrectPromptRequestToJson(_$_CorrectPromptRequest instance) => <String, dynamic>{
      'model_speed': instance.modelSpeed,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'prompt_source': instance.prompt,
    };
