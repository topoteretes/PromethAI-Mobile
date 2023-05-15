import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/model/journey.dart';
import 'package:prometh_ai/state/app_state.dart';

class SelectedJourneyNotifier extends StateNotifier<Journey?> {
  final Ref ref;
  static final provider = StateNotifierProvider<SelectedJourneyNotifier, Journey?>(SelectedJourneyNotifier.new);

  SelectedJourneyNotifier(this.ref) : super(null);

  store(Journey journey) => state = journey;
  open() {
    state = null;
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    appStateNotifier.prevJourneys();
  }
}
