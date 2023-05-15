// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'tree.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tree _$$_TreeFromJson(Map<String, dynamic> json) => _$_Tree(
      goal: NameAmount.fromJson(json['goal'] as Map<String, dynamic>),
      children: (json['children'] as List<dynamic>).map((e) => Tree.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_TreeToJson(_$_Tree instance) => <String, dynamic>{
      'goal': instance.goal,
      'children': instance.children,
    };
