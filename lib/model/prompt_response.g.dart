// ignore_for_file: non_constant_identifier_names

part of 'prompt_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromptResponse _$$_PromptResponseFromJson(Map<String, dynamic> json) => _$_PromptResponse(
      results: (json['results'] as List<dynamic>).map((e) => Tree.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_PromptResponseToJson(_$_PromptResponse instance) => <String, dynamic>{
      'results': instance.results,
    };
