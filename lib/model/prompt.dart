import 'package:freezed_annotation/freezed_annotation.dart';

part 'prompt.freezed.dart';
part 'prompt.g.dart';

@freezed
class Prompt with _$Prompt {
  const factory Prompt({
    required String original,
    required String current,
    required String changed,
    required Map<String, String> originalMap,
    required bool updating,
  }) = _Prompt;

  factory Prompt.fromJson(Map<String, dynamic> json) => _$PromptFromJson(json);
}
