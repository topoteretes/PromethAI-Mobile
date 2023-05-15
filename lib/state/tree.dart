import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/diet_goal_request.dart';
import 'package:prometh_ai/model/diet_goal_response.dart';
import 'package:prometh_ai/model/diet_sub_goal_request.dart';
import 'package:prometh_ai/model/diet_sub_goal_response.dart';
import 'package:prometh_ai/model/name_amount.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/mode_speed.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/utils/dio/dio_ext.dart';

import 'api.dart';
import 'path.dart';
import 'session_id.dart';

Map<dynamic, dynamic> _folder(accu, g) => {...accu, g.goalName: g.subGoals.map((g) => Tree(goal: g, children: []))};
MapEntry<String, List<Tree>> _sortMapper(key, value) => MapEntry(key, [...value]..sort(_sorter));
int _sorter(Tree a, Tree b) => a.name.compareTo(b.name);

class TreeNotifier extends StateNotifier<Tree> {
  final Ref ref;
  static final provider = StateNotifierProvider<TreeNotifier, Tree>(TreeNotifier.new);

  TreeNotifier(this.ref) : super(Tree.empty);

  start() async {
    final topLevelGoals = await _getTopLevelGoals();
    state = state.copyWith(children: topLevelGoals);
    ref.read(PathNotifier.provider.notifier).change(state.children.first.name);

    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    appStateNotifier.goal();
    await _updateGoals([], topLevelGoals);
  }

  updateAmount(NameAmount goal) {
    final path = ref.read(PathNotifier.provider);
    state = state.updateAmount([...path, goal.name], goal.amount);
  }

  goDown(Tree node) async {
    final path = ref.read(PathNotifier.provider);
    final selected = state.findSelected(path);
    ref.read(PathNotifier.provider.notifier).add(node.name);
    await _updateGoals(path, selected.children);
  }

  reset(Tree tree) => state = tree;

  Future<void> _updateGoals(List<String> path, List<Tree> topLevelGoals) async {
    if (topLevelGoals.first.children.isNotEmpty) {
      return;
    }
    final goalsWithChildren = await _fetchNewGoals(topLevelGoals);
    state = state.updateChildren(path, goalsWithChildren);
  }

  Future<List<Tree>> _fetchNewGoals(List<Tree> topLevelNodes) async {
    final nodeMapByGoalName = await _getGoals(topLevelNodes);
    return topLevelNodes.map((g) => g.copyWith(children: nodeMapByGoalName[g.name]!)).toList();
  }

  Future<List<Tree>> _getTopLevelGoals() async {
    final payload = DietGoalRequest(
      userId: ref.read(UserIdNotifier.provider),
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
    );
    final result =
        await ref.read(dio).safePost('/generate-diet-goal', DietGoalResponse.fromJson, data: {'payload': payload.toJson()}, ref: ref);
    return result.goals.mapp((name) => Tree(goal: NameAmount(name: name, amount: 0), children: []))..sort(_sorter);
  }

  Future<Map<String, List<Tree>>> _getGoals(List<Tree> factors) async {
    final payload = DietSubGoalRequest(
      userId: ref.read(UserIdNotifier.provider),
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      factors: factors.mapp((n) => n.goal),
    );
    final result = await ref
        .read(dio)
        .safePost('/generate-diet-sub-goal', DietSubGoalResponse.fromJson, data: {'payload': payload.toJson()}, ref: ref);
    return result.subGoals.fold({}, _folder).map(_sortMapper);
  }
}
