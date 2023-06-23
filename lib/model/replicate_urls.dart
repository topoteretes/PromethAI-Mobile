import 'package:freezed_annotation/freezed_annotation.dart';

part 'replicate_urls.freezed.dart';
part 'replicate_urls.g.dart';

@freezed
class ReplicateUrls with _$ReplicateUrls {
  const factory ReplicateUrls({
    required String cancel,
    required String get,
  }) = _ReplicateUrls;

  factory ReplicateUrls.fromJson(Map<String, dynamic> json) => _$ReplicateUrlsFromJson(json);
}
