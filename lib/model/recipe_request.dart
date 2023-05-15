import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/name_amount.dart';

part 'recipe_request.freezed.dart';
part 'recipe_request.g.dart';

@freezed
class RecipeRequest with _$RecipeRequest {
  const factory RecipeRequest({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    required List<NameAmount> factors,
  }) = _RecipeRequest;

  factory RecipeRequest.fromJson(Map<String, dynamic> json) => _$RecipeRequestFromJson(json);
}
