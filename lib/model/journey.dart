import 'package:freezed_annotation/freezed_annotation.dart';

import 'tree.dart';

part 'journey.freezed.dart';
part 'journey.g.dart';

@freezed
class Journey with _$Journey {
  static Journey root = Journey(created: 0, modified: 0, path: [], tree: Tree.empty);

  const factory Journey({
    required Tree tree,
    required int created,
    required int modified,
    required List<String> path,
  }) = _Journey;

  factory Journey.fromJson(Map<String, dynamic> json) => _$JourneyFromJson(json);
}
