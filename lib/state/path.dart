import 'package:flutter_riverpod/flutter_riverpod.dart';

class PathNotifier extends StateNotifier<List<String>> {
  final Ref ref;
  static final provider = StateNotifierProvider<PathNotifier, List<String>>(PathNotifier.new);

  PathNotifier(this.ref) : super([]);

  change(String segment) => state = state.isEmpty ? [segment] : [...state..removeLast(), segment];
  add(String segment) => state = [...state, segment];
  back() => state = [...state]..removeLast();

  reset(List<String> path) => state = path;
}
