// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names
part of 'recipe_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeRequest _$$_RecipeRequestFromJson(Map<String, dynamic> json) => _$_RecipeRequest(
      userId: json['user_id'] as String,
      sessionId: json['session_id'] as String,
      factors: (json['factors'] as List<dynamic>).map((e) => NameAmount.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_RecipeRequestToJson(_$_RecipeRequest instance) => <String, dynamic>{
      'user_id': instance.userId,
      'session_id': instance.sessionId,
      'factors': instance.factors,
    };
