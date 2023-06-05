// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'prompt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromptResponse _$$_PromptResponseFromJson(Map<String, dynamic> json) => _$_PromptResponse(
      prompt: json['prompt'] as String,
      tree: (json['tree'] as List<dynamic>).map((e) => Tree.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_PromptResponseToJson(_$_PromptResponse instance) => <String, dynamic>{
      'prompt': instance.prompt,
      'tree': instance.tree,
    };
