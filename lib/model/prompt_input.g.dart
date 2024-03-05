// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'prompt_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PromptInput _$$_PromptInputFromJson(Map<String, dynamic> json) => _$_PromptInput(
      prompt: json['prompt'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
      numInferenceSteps: json['num_inference_steps'] as int,
      scheduler: json['scheduler'] as String,
    );

Map<String, dynamic> _$$_PromptInputToJson(_$_PromptInput instance) => <String, dynamic>{
      'prompt': instance.prompt,
      'width': instance.width,
      'height': instance.height,
      'num_inference_steps': instance.numInferenceSteps,
      'scheduler': instance.scheduler,
    };
