// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'recipe_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeResponse _$$_RecipeResponseFromJson(Map<String, dynamic> json) => _$_RecipeResponse(
      recipes: (json['recipes'] as List<dynamic>).map((e) => Recipe.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_RecipeResponseToJson(_$_RecipeResponse instance) => <String, dynamic>{
      'recipes': instance.recipes,
    };
