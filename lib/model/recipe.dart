import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    required String title,
    required double rating,
    @JsonKey(name: "prep_time") required int prepTime,
    @JsonKey(name: "cook_time") required int cookTime,
    required String description,
    required List<String> ingredients,
    required List<String> instructions,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
