// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replicate_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReplicateRequest _$$_ReplicateRequestFromJson(Map<String, dynamic> json) =>
    _$_ReplicateRequest(
      version: json['version'] as String,
      input: PromptInput.fromJson(json['input'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReplicateRequestToJson(_$_ReplicateRequest instance) =>
    <String, dynamic>{
      'version': instance.version,
      'input': instance.input,
    };
