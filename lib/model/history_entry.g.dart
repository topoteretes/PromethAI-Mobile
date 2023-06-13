// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'history_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_HistoryEntry _$$_HistoryEntryFromJson(Map<String, dynamic> json) => _$_HistoryEntry(
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      created: json['created'] as int,
      favorite: json['favorite'] as bool,
      prompt: json['prompt'] as String,
    );

Map<String, dynamic> _$$_HistoryEntryToJson(_$_HistoryEntry instance) => <String, dynamic>{
      'recipe': instance.recipe,
      'created': instance.created,
      'favorite': instance.favorite,
      'prompt': instance.prompt,
    };
