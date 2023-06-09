// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Recipe _$$_RecipeFromJson(Map<String, dynamic> json) => _$_Recipe(
      title: json['title'] as String,
      rating: (json['rating'] as num).toDouble(),
      prepTime: json['prep_time'] as String,
      cookTime: json['cook_time'] as String,
      description: json['description'] as String,
      ingredients: (json['ingredients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      instructions: (json['instructions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_RecipeToJson(_$_Recipe instance) => <String, dynamic>{
      'title': instance.title,
      'rating': instance.rating,
      'prep_time': instance.prepTime,
      'cook_time': instance.cookTime,
      'description': instance.description,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
    };
