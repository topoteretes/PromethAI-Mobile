import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

part 'api_error.g.dart';

@freezed
class ApiError with _$ApiError {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ApiError({required int? code, required String message}) =
      _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
