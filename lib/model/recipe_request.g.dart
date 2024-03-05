// ignore_for_file: non_constant_identifier_names

part of 'recipe_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeRequest _$$_RecipeRequestFromJson(Map<String, dynamic> json) => _$_RecipeRequest(
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      modelSpeed: json['model_speed'] as String,
      prompt: json['prompt'] as String,
    );

Map<String, dynamic> _$$_RecipeRequestToJson(_$_RecipeRequest instance) => <String, dynamic>{
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'model_speed': instance.modelSpeed,
      'prompt': instance.prompt,
    };
