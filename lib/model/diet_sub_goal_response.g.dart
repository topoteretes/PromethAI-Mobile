// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'diet_sub_goal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DietSubGoalResponse _$$_DietSubGoalResponseFromJson(Map<String, dynamic> json) => _$_DietSubGoalResponse(
      subGoals: (json['sub_goals'] as List<dynamic>).map((e) => SubGoal.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_DietSubGoalResponseToJson(_$_DietSubGoalResponse instance) => <String, dynamic>{
      'sub_goals': instance.subGoals,
    };
