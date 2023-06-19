import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';

import 'top_category.dart';

final selectedPath = Provider((ref) {
  final path = ref.watch(PathNotifier.provider);
  final topCategory = ref.watch(TopCategoryNotifier.provider);
  return path[topCategory] ?? [];
});

class PathNotifier extends StateNotifier<Map<String, List<String>>> {
  final Ref ref;
  static final provider = StateNotifierProvider<PathNotifier, Map<String, List<String>>>(PathNotifier.new);

  PathNotifier(this.ref) : super({});

  change(String segment) {
    final topCategory = ref.read(TopCategoryNotifier.provider);
    final currentPath = state[topCategory] ?? [];
    final newPath = currentPath.isEmpty ? [segment] : [...currentPath..removeLast(), segment];
    state = {...state, topCategory: newPath};
  }

  add(String segment) {
    final topCategory = ref.read(TopCategoryNotifier.provider);
    final currentPath = state[topCategory] ?? [];
    final newPath = [...currentPath, segment];

    Segment.track(eventName: 'Expand subtree', properties: {'path': newPath});
    state = {...state, topCategory: newPath};
  }

  back() {
    final topCategory = ref.read(TopCategoryNotifier.provider);
    final currentPath = state[topCategory] ?? [];

    Segment.track(eventName: 'Collapse subtree', properties: {'path': currentPath});
    final newPath = [...currentPath..removeLast()];
    state = {...state, topCategory: newPath};
  }
}
