// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'prompt_decompose_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromptChooseRequest _$$_PromptChooseRequestFromJson(Map<String, dynamic> json) => _$_PromptChooseRequest(
      modelSpeed: json['model_speed'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      prompt: json['prompt'] as String,
    );

Map<String, dynamic> _$$_PromptChooseRequestToJson(_$_PromptChooseRequest instance) => <String, dynamic>{
      'model_speed': instance.modelSpeed,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'prompt': instance.prompt,
    };
