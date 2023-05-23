import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/model/journey.dart';

class SelectedJourneyNotifier extends StateNotifier<Journey> {
  final Ref ref;
  static final provider = StateNotifierProvider<SelectedJourneyNotifier, Journey>(SelectedJourneyNotifier.new);

  SelectedJourneyNotifier(this.ref) : super(Journey.starter());

  store(Journey journey) => state = journey;
}
