// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replicate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReplicateResponse _$$_ReplicateResponseFromJson(Map<String, dynamic> json) =>
    _$_ReplicateResponse(
      id: json['id'] as String,
      version: json['version'] as String,
      input: PromptInput.fromJson(json['input'] as Map<String, dynamic>),
      logs: json['logs'] as String,
      error:
          (json['error'] as List<dynamic>?)?.map((e) => e as String).toList(),
      output:
          (json['output'] as List<dynamic>?)?.map((e) => e as String).toList(),
      status: json['status'] as String,
      createdAt: json['created_at'] as String,
      completedAt: json['completed_at'] as String?,
      urls: ReplicateUrls.fromJson(json['urls'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReplicateResponseToJson(
        _$_ReplicateResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'input': instance.input,
      'logs': instance.logs,
      'error': instance.error,
      'output': instance.output,
      'status': instance.status,
      'created_at': instance.createdAt,
      'completed_at': instance.completedAt,
      'urls': instance.urls,
    };
