import 'package:freezed_annotation/freezed_annotation.dart';

part 'pexel_params.freezed.dart';
part 'pexel_params.g.dart';

@freezed
class PexelParams with _$PexelParams {
  const factory PexelParams({
    required String query,
    required String size,
  }) = _PexelParams;

  factory PexelParams.fromJson(Map<String, dynamic> json) => _$PexelParamsFromJson(json);
}
