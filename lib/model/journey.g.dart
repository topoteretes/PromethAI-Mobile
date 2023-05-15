// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'journey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Journey _$$_JourneyFromJson(Map<String, dynamic> json) => _$_Journey(
      tree: Tree.fromJson(json['tree'] as Map<String, dynamic>),
      created: json['created'] as int,
      modified: json['modified'] as int,
      path: (json['path'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_JourneyToJson(_$_Journey instance) => <String, dynamic>{
      'tree': instance.tree,
      'created': instance.created,
      'modified': instance.modified,
      'path': instance.path,
    };
