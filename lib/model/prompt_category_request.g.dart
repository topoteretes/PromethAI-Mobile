// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_category_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromptCategoryRequest _$$_PromptCategoryRequestFromJson(
        Map<String, dynamic> json) =>
    _$_PromptCategoryRequest(
      modelSpeed: json['model_speed'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      promptStruct: json['prompt_struct'] as String,
    );

Map<String, dynamic> _$$_PromptCategoryRequestToJson(
        _$_PromptCategoryRequest instance) =>
    <String, dynamic>{
      'model_speed': instance.modelSpeed,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'prompt_struct': instance.promptStruct,
    };
