import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_input_request.freezed.dart';
part 'voice_input_request.g.dart';

@freezed
class VoiceInputRequest with _$VoiceInputRequest {
  const factory VoiceInputRequest({
    required String query,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: "model_speed") required String modelSpeed,
  }) = _VoiceInputRequest;

  factory VoiceInputRequest.fromJson(Map<String, dynamic> json) => _$VoiceInputRequestFromJson(json);
}
