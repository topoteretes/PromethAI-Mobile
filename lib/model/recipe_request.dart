import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_request.freezed.dart';
part 'recipe_request.g.dart';

@freezed
class RecipeRequest with _$RecipeRequest {
  const factory RecipeRequest({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: "model_speed") required String modelSpeed,
    required String prompt,
  }) = _RecipeRequest;

  factory RecipeRequest.fromJson(Map<String, dynamic> json) => _$RecipeRequestFromJson(json);
}
