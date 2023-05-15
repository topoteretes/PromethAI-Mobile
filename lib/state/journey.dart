import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:prometh_ai/ext/date_time_ext.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/journey.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/selected_journey.dart';

import 'app_state.dart';
import 'path.dart';
import 'tree.dart';
import 'user_id.dart';

int _sorter(Journey a, Journey b) => b.modified.compareTo(a.modified);

class JourneyNotifier extends HydratedStateNotifier<List<Journey>> {
  static const key = "JourneyNotifier";
  final Ref ref;
  static final provider = StateNotifierProvider<JourneyNotifier, List<Journey>>(JourneyNotifier.new);

  JourneyNotifier(this.ref) : super([]);

  _updateNotifiers(Journey journey) async {
    final user = await Amplify.Auth.getCurrentUser();
    // Set userid on the first use
    ref.read(UserIdNotifier.provider.notifier).state = user.userId;

    final pathNotifier = ref.read(PathNotifier.provider.notifier);
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);

    pathNotifier.reset([...journey.path]);
    treeNotifier.reset(journey.tree);

    if (journey.path.isEmpty) {
      await treeNotifier.start();
    }
  }

  @override
  @override
  List<Journey> fromJson(Map<String, dynamic> json) =>
      json[key] == null ? [] : (json[key] as List<dynamic>).mapp((m) => Journey.fromJson(m));

  @override
  Map<String, dynamic> toJson(List<Journey> state) => {key: state};

  startNew() async {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    appStateNotifier.initialGoals();

    final journey = Journey(tree: Tree.empty, created: DateTimeExt.timestamp(), path: [], modified: DateTimeExt.timestamp());
    state = [...state, journey]..sort(_sorter);
    ref.read(SelectedJourneyNotifier.provider.notifier).store(journey);

    await _updateNotifiers(journey);
  }

  _updateStateWithJourney(Journey journey) => state = [...state.where((j) => j.created != journey.created), journey]..sort(_sorter);

  deleteAll() => state = [];

  exitAndSave() {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final selectedJourney = ref.read(SelectedJourneyNotifier.provider);
    final path = ref.read(PathNotifier.provider);

    if (selectedJourney != null && path.isNotEmpty) {
      final tree = ref.read(TreeNotifier.provider);
      final updatedJourney = state.firstWhere((j) => j.created == selectedJourney.created);
      final journeyToSave = updatedJourney.copyWith(tree: tree, path: path, modified: DateTimeExt.timestamp());
      _updateStateWithJourney(journeyToSave);
    }
    appStateNotifier.start();
  }

  resume(Journey j) {
    ref.read(SelectedJourneyNotifier.provider.notifier).store(j);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    appStateNotifier.goal();
    _updateNotifiers(j);
  }
}
