// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Prompt _$$_PromptFromJson(Map<String, dynamic> json) => _$_Prompt(
      original: json['original'] as String,
      current: json['current'] as String,
      changed: json['changed'] as String,
      originalMap: Map<String, String>.from(json['originalMap'] as Map),
      updating: json['updating'] as bool,
    );

Map<String, dynamic> _$$_PromptToJson(_$_Prompt instance) => <String, dynamic>{
      'original': instance.original,
      'current': instance.current,
      'changed': instance.changed,
      'originalMap': instance.originalMap,
      'updating': instance.updating,
    };
