import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_choose_request.freezed.dart';
part 'prompt_choose_request.g.dart';

@freezed
class PromptChooseRequest with _$PromptChooseRequest {
  const factory PromptChooseRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    required String prompt,
  }) = _PromptChooseRequest;

  factory PromptChooseRequest.fromJson(Map<String, dynamic> json) => _$PromptChooseRequestFromJson(json);
}
