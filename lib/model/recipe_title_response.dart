import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_title_response.freezed.dart';
part 'recipe_title_response.g.dart';

@freezed
class RecipeTitleResponse with _$RecipeTitleResponse {
  const factory RecipeTitleResponse({
    required String response,
  }) = _RecipeTitleResponse;

  factory RecipeTitleResponse.fromJson(Map<String, dynamic> json) => _$RecipeTitleResponseFromJson(json);
}
