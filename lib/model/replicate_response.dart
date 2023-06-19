import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/prompt_input.dart';

import 'replicate_urls.dart';

part 'replicate_response.freezed.dart';
part 'replicate_response.g.dart';

/*
{
  "id": "3f7goyrb3726gelfj57nan4kla",
  "version": "db21e45d3f7023abc2a46ee38a23973f6dce16bb082a930b0c49861f96d1e5bf",
  "input": {
    "prompt": "a vision of paradise. unreal engine"
  },
  "logs": "",
  "error": null,
  "status": "starting",
  "created_at": "2023-06-16T12:14:14.612812426Z",
  "urls": {
    "cancel": "https://api.replicate.com/v1/predictions/3f7goyrb3726gelfj57nan4kla/cancel",
    "get": "https://api.replicate.com/v1/predictions/3f7goyrb3726gelfj57nan4kla"
  }
}
 */

@freezed
class ReplicateResponse with _$ReplicateResponse {
  const factory ReplicateResponse({
    required String id,
    required String version,
    required PromptInput input,
    required String logs,
    List<String>? error,
    List<String>? output,
    required String status,
    @JsonKey(name: "created_at") required String createdAt,
    @JsonKey(name: "completed_at") String? completedAt,
    required ReplicateUrls urls,
  }) = _ReplicateResponse;

  factory ReplicateResponse.fromJson(Map<String, dynamic> json) => _$ReplicateResponseFromJson(json);
}
