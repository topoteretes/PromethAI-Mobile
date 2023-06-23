import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/recipe.dart';

part 'history_entry.freezed.dart';
part 'history_entry.g.dart';

@freezed
class HistoryEntry with _$HistoryEntry {
  const factory HistoryEntry({
    required Recipe recipe,
    required int created,
    required bool favorite,
    required String prompt,
  }) = _HistoryEntry;

  factory HistoryEntry.fromJson(Map<String, dynamic> json) => _$HistoryEntryFromJson(json);
}
