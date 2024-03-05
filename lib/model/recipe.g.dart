// ignore_for_file: non_constant_identifier_names

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      title: json['title'] as String,
      prepTime: json['prep_time'] as String,
      cookTime: json['cook_time'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>).map((e) => e as String).toList(),
      instructions: (json['instructions'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'title': instance.title,
      'prep_time': instance.prepTime,
      'cook_time': instance.cookTime,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
    };
