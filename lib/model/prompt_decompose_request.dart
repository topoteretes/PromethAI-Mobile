import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_decompose_request.freezed.dart';
part 'prompt_decompose_request.g.dart';

@freezed
class PromptDecomposeRequest with _$PromptDecomposeRequest {
  const factory PromptDecomposeRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'user_defaults') required String userDefaults,
    required String prompt,
  }) = _PromptChooseRequest;

  factory PromptDecomposeRequest.fromJson(Map<String, dynamic> json) => _$PromptDecomposeRequestFromJson(json);
}
