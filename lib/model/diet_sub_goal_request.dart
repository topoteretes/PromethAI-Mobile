import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/name_amount.dart';

part 'diet_sub_goal_request.freezed.dart';
part 'diet_sub_goal_request.g.dart';

@freezed
class DietSubGoalRequest with _$DietSubGoalRequest {
  const factory DietSubGoalRequest({
    @JsonKey(name: "model_speed") required String modelSpeed,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'session_id') required String sessionId,
    required List<NameAmount> factors,
  }) = _DietSubGoalRequest;

  factory DietSubGoalRequest.fromJson(Map<String, dynamic> json) => _$DietSubGoalRequestFromJson(json);
}
