import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/name_amount.dart';

part 'sub_goal.freezed.dart';
part 'sub_goal.g.dart';

@freezed
class SubGoal with _$SubGoal {
  const factory SubGoal({
    @JsonKey(name: "goal_name") required String goalName,
    @JsonKey(name: "sub_goals") required List<NameAmount> subGoals,
  }) = _SubGoal;

  factory SubGoal.fromJson(Map<String, dynamic> json) => _$SubGoalFromJson(json);
}
