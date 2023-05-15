import 'package:freezed_annotation/freezed_annotation.dart';

part 'diet_goal_request.freezed.dart';

part 'diet_goal_request.g.dart';

/*
"model_speed": "slow",
"user_id": "659",
"session_id": "458"
 */

@freezed
class DietGoalRequest with _$DietGoalRequest {
  const factory DietGoalRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
  }) = _DietGoalRequest;

  factory DietGoalRequest.fromJson(Map<String, dynamic> json) => _$DietGoalRequestFromJson(json);
}
