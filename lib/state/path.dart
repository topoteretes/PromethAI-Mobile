import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/model/journey.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/app_state.dart';

import 'journey.dart';
import 'selected_journey.dart';

class PathNotifier extends StateNotifier<List<String>> {
  final Ref ref;
  static final provider = StateNotifierProvider<PathNotifier, List<String>>(PathNotifier.new);

  PathNotifier(this.ref) : super([Tree.starter.children.first.name]);

  change(String segment) => state = state.isEmpty ? [segment] : [...state..removeLast(), segment];

  add(String segment) => state = [...state, segment];
  back() {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final selectedJourneyNotifier = ref.read(SelectedJourneyNotifier.provider.notifier);
    final journeyNotifier = ref.read(JourneyNotifier.provider.notifier);

    state = [...state]..removeLast();
    if (state.length == 1) {
      selectedJourneyNotifier.store(Journey.starter());
      journeyNotifier.start();
      appStateNotifier.start();
    }
  }

  reset(List<String> path) => state = path;
}
