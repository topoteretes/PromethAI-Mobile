// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Node _$$_NodeFromJson(Map<String, dynamic> json) => _$_Node(
      category: json['category'] as String,
      options: (json['options'] as List<dynamic>?)?.map((e) => Tree.fromJson(e as Map<String, dynamic>)).toList() ?? const [],
      preference: (json['preference'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
    );

Map<String, dynamic> _$$_NodeToJson(_$_Node instance) => <String, dynamic>{
      'category': instance.category,
      'options': instance.options,
      'preference': instance.preference,
    };
