import 'package:freezed_annotation/freezed_annotation.dart';

part 'correct_prompt_request.freezed.dart';
part 'correct_prompt_request.g.dart';

@freezed
class CorrectPromptRequest with _$CorrectPromptRequest {
  const factory CorrectPromptRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'prompt_source') required String prompt,
  }) = _CorrectPromptRequest;

  factory CorrectPromptRequest.fromJson(Map<String, dynamic> json) => _$CorrectPromptRequestFromJson(json);
}
