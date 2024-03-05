import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe.freezed.dart';
part 'recipe.g.dart';

@freezed
class Recipe with _$Recipe {
  static const empty = Recipe(title: '', prepTime: '', cookTime: '', description: '', ingredients: [], instructions: []);
  const factory Recipe({
    required String title,
    @JsonKey(name: "prep_time") required String prepTime,
    @JsonKey(name: "cook_time") required String cookTime,
    required String description,
    required List<String> ingredients,
    required List<String> instructions,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
