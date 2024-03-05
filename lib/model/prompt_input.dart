import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_input.freezed.dart';
part 'prompt_input.g.dart';

@freezed
class PromptInput with _$PromptInput {
  const factory PromptInput({
    required String prompt,
    required int width,
    required int height,
    @JsonKey(name: "num_inference_steps") required int numInferenceSteps,
    required String scheduler,
  }) = _PromptInput;

  factory PromptInput.fromJson(Map<String, dynamic> json) => _$PromptInputFromJson(json);
}
