import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/ext/date_time_ext.dart';

import 'tree.dart';

part 'journey.freezed.dart';
part 'journey.g.dart';

@freezed
class Journey with _$Journey {
  const factory Journey({
    required Tree tree,
    required int created,
    required int modified,
    required List<String> path,
  }) = _Journey;

  factory Journey.fromJson(Map<String, dynamic> json) => _$JourneyFromJson(json);

  static starter() => Journey(
      tree: Tree.starter, created: DateTimeExt.timestamp(), path: [Tree.starter.children.first.name], modified: DateTimeExt.timestamp());
}
