import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_update_request.freezed.dart';
part 'prompt_update_request.g.dart';

@freezed
class PromptUpdateRequest with _$PromptUpdateRequest {
  const factory PromptUpdateRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    required String category,
    required String from,
    required String to,
  }) = _PromptUpdateRequest;

  factory PromptUpdateRequest.fromJson(Map<String, dynamic> json) => _$PromptUpdateRequestFromJson(json);
}
