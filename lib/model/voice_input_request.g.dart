// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'voice_input_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VoiceInputRequest _$$_VoiceInputRequestFromJson(Map<String, dynamic> json) => _$_VoiceInputRequest(
      query: json['query'] as String,
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      modelSpeed: json['model_speed'] as String,
    );

Map<String, dynamic> _$$_VoiceInputRequestToJson(_$_VoiceInputRequest instance) => <String, dynamic>{
      'query': instance.query,
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'model_speed': instance.modelSpeed,
    };
