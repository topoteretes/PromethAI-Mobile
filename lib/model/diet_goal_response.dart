import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet_goal_response.freezed.dart';
part 'diet_goal_response.g.dart';

/*
{
    "response": {
        "goals": [
            "Cuisine",
            "Healthy",
            "Budget",
            "Taste"
        ]
    }
}
 */

@freezed
class DietGoalResponse with _$DietGoalResponse {
  const factory DietGoalResponse({
    required List<String> goals,
  }) = _DietGoalResponse;

  factory DietGoalResponse.fromJson(Map<String, dynamic> json) => _$DietGoalResponseFromJson(json);
}
