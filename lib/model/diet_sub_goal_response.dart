import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/sub_goal.dart';

part 'diet_sub_goal_response.freezed.dart';
part 'diet_sub_goal_response.g.dart';

/*
{
    "response": {
        "sub_goals": [
            {
                "goal_name": "Portion Control",
                "sub_goals": [
                    {
                        "name": "Protein",
                        "value": 50
                    },
                    {
                        "name": "Carbohydrates",
                        "value": 30
                    },
                    {
                        "name": "Fats",
                        "value": 20
                    },
                    {
                        "name": "Fiber",
                        "value": 50
                    }
                ]
            },
            {
                "goal_name": "Cuisine",
                "sub_goals": [
                    {
                        "name": "Italian",
                        "value": 50
                    },
                    {
                        "name": "Mexican",
                        "value": 30
                    },
                    {
                        "name": "Chinese",
                        "value": 20
                    },
                    {
                        "name": "Indian",
                        "value": 50
                    }
                ]
            },
            {
                "goal_name": "Macronutrients",
                "sub_goals": [
                    {
                        "name": "Protein",
                        "value": 50
                    },
                    {
                        "name": "Carbohydrates",
                        "value": 30
                    },
                    {
                        "name": "Fats",
                        "value": 20
                    },
                    {
                        "name": "Fiber",
                        "value": 50
                    }
                ]
            }
        ]
    }
}
 */

@freezed
class DietSubGoalResponse with _$DietSubGoalResponse {
  const factory DietSubGoalResponse({
    @JsonKey(name: "sub_goals") required List<SubGoal> subGoals,
  }) = _DietSubGoalResponse;

  factory DietSubGoalResponse.fromJson(Map<String, dynamic> json) => _$DietSubGoalResponseFromJson(json);
}
