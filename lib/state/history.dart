import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:prometh_ai/ext/date_time_ext.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/history_entry.dart';
import 'package:prometh_ai/model/recipe.dart';

class HistoryNotifier extends HydratedStateNotifier<List<HistoryEntry>> {
  static const key = 'History_';
  static final provider = StateNotifierProvider<HistoryNotifier, List<HistoryEntry>>(HistoryNotifier.new);

  final Ref ref;

  HistoryNotifier(this.ref) : super([]);

  @override
  List<HistoryEntry> fromJson(Map<String, dynamic> json) =>
      json[key] == null ? [] : (json[key] as List<dynamic>).mapp((m) => HistoryEntry.fromJson(m));

  @override
  Map<String, dynamic> toJson(List<HistoryEntry> state) => {key: state};

  addAll(List<Recipe> recipes, String prompt) {
    final existingTitles = state.mapp((e) => e.recipe.title);
    final newEntries = recipes
        .where((e) => !existingTitles.contains(e.title))
        .mapp((e) => HistoryEntry(recipe: e, created: DateTimeExt.timestamp(), favorite: false, prompt: prompt));
    state = [...newEntries, ...state];
  }

  toggleFavorite(Recipe recipe) => state = state.mapp((e) => e.recipe.title == recipe.title ? e.copyWith(favorite: !e.favorite) : e);

  remove(Recipe recipe) => state = [...state.where((e) => e.recipe.title != recipe.title)];

  cleanup() => [];
}
