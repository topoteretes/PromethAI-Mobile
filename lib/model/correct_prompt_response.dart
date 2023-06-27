import 'package:freezed_annotation/freezed_annotation.dart';

part 'correct_prompt_response.freezed.dart';
part 'correct_prompt_response.g.dart';

@freezed
class CorrectPromptResponse with _$CorrectPromptResponse {
  const factory CorrectPromptResponse({
    required String result,
  }) = _CorrectPromptResponse;

  factory CorrectPromptResponse.fromJson(Map<String, dynamic> json) => _$CorrectPromptResponseFromJson(json);
}
