import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt_category_request.freezed.dart';
part 'prompt_category_request.g.dart';

@freezed
class PromptCategoryRequest with _$PromptCategoryRequest {
  const factory PromptCategoryRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'prompt_struct') required String promptStruct,
  }) = _PromptCategoryRequest;

  factory PromptCategoryRequest.fromJson(Map<String, dynamic> json) => _$PromptCategoryRequestFromJson(json);
}
