import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/tree.dart';

part 'prompt_response.freezed.dart';
part 'prompt_response.g.dart';

@freezed
class PromptResponse with _$PromptResponse {
  const factory PromptResponse({
    required List<Tree> results,
  }) = _PromptResponse;

  factory PromptResponse.fromJson(Map<String, dynamic> json) => _$PromptResponseFromJson(json);
}
