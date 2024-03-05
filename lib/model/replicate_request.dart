import 'package:freezed_annotation/freezed_annotation.dart';

import 'prompt_input.dart';

part 'replicate_request.freezed.dart';
part 'replicate_request.g.dart';

@freezed
class ReplicateRequest with _$ReplicateRequest {
  const factory ReplicateRequest({
    required String version,
    required PromptInput input,
  }) = _ReplicateRequest;

  factory ReplicateRequest.fromJson(Map<String, dynamic> json) => _$ReplicateRequestFromJson(json);
}
