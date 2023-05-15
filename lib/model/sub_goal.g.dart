// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'sub_goal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubGoal _$$_SubGoalFromJson(Map<String, dynamic> json) => _$_SubGoal(
      goalName: json['goal_name'] as String,
      subGoals: (json['sub_goals'] as List<dynamic>).map((e) => NameAmount.fromJson(e as Map<String, dynamic>)).toList(),
    );

Map<String, dynamic> _$$_SubGoalToJson(_$_SubGoal instance) => <String, dynamic>{
      'goal_name': instance.goalName,
      'sub_goals': instance.subGoals,
    };
