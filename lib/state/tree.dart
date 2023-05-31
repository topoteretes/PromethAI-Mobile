import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/api.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/diet_sub_goal_request.dart';
import 'package:prometh_ai/model/diet_sub_goal_response.dart';
import 'package:prometh_ai/model/name_amount.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/model/voice_input_request.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/mode_speed.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/utils/logger.dart';

import 'path.dart';
import 'session_id.dart';

Map<dynamic, dynamic> _folder(accu, g) => {...accu, g.goalName: g.subGoals.map((g) => Tree(goal: g, children: []))};

MapEntry<String, List<Tree>> _sortMapper(key, value) => MapEntry(key, [...value]..sort(_sorter));

int _sorter(Tree a, Tree b) => a.name.compareTo(b.name);

CancelToken? _voiceInputToken;
CancelToken? _dietSubGoalToken;

class TreeNotifier extends StateNotifier<Tree> {
  final Ref ref;
  static final provider = StateNotifierProvider<TreeNotifier, Tree>(TreeNotifier.new);

  TreeNotifier(this.ref) : super(Tree.starter);

  updateAmount(NameAmount goal) {
    final path = ref.read(PathNotifier.provider);
    state = state.updateAmount([...path, goal.name], goal.amount);
  }

  goDown(Tree node) async {
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    final path = ref.read(PathNotifier.provider);
    final pathNotifier = ref.read(PathNotifier.provider.notifier);

    final selected = state.findSelected(path);
    pathNotifier.add(node.name);

    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    deepgramNotifier.stopRecord(true);
    appStateNotifier.goal();

    await updateGoals(path, selected.children);
  }

  reset(Tree tree) => state = tree;

  Future<void> updateGoals(List<String> path, List<Tree> topLevelGoals) async {
    if (topLevelGoals.first.children.isNotEmpty) {
      return;
    }

    final nodeMapByGoalName = await _getGoals(topLevelGoals);
    final goalsWithChildren = topLevelGoals.map((g) => g.copyWith(children: nodeMapByGoalName[g.name]!)).toList();
    state = state.updateChildren(path, goalsWithChildren);
  }

  Future<void> replaceGoals(List<String> path, List<Tree> topLevelGoals, String query) async {
    final pathNotifier = ref.read(PathNotifier.provider.notifier);
    pathNotifier.back();

    final nodeMapByGoalName = await _replaceGoals(query);

    final subTree = nodeMapByGoalName.keys.mapp((e) => Tree(goal: NameAmount(name: e, amount: 50), children: nodeMapByGoalName[e]!));
    L.d("----->subTree: $subTree");
    L.d("----->path: $subTree");
    final goalsWithChildren = topLevelGoals.map((g) => g.copyWith(children: subTree)).toList();
    state = state.updateChildren(path, goalsWithChildren);
    pathNotifier.add(subTree.first.name);
  }

  Future<Map<String, List<Tree>>> _getGoals(List<Tree> factors) async {
    final payload = DietSubGoalRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      modelSpeed: ref.read(modelSpeed),
      factors: factors.mapp((n) => n.goal),
    );

    _dietSubGoalToken?.cancel();
    _dietSubGoalToken = CancelToken();

    try {
      final result = await ref.read(dio).safePost(
            '/generate-diet-sub-goal',
            DietSubGoalResponse.fromJson,
            cancelToken: _dietSubGoalToken,
            data: {'payload': payload.toJson()},
            ref: ref,
          );
      return result.subGoals.fold({}, _folder).map(_sortMapper);
    } on Exception catch (e) {
      ref.read(ErrorNotifier.provider.notifier).store(e.toString());
      rethrow;
    }
  }

  Future<Map<String, List<Tree>>> _replaceGoals(String query) async {
    final payload = VoiceInputRequest(
      userId: ref.read(UserIdNotifier.provider)!,
      sessionId: ref.read(sessionId)!,
      query: query,
      modelSpeed: ref.read(modelSpeed),
    );
    _voiceInputToken?.cancel();
    _voiceInputToken = CancelToken();

    try {
      final result = await ref.read(dio).safePost(
            '/voice-input',
            DietSubGoalResponse.fromJson,
            cancelToken: _voiceInputToken,
            data: {'payload': payload.toJson()},
            ref: ref,
          );

      return result.subGoals.fold({}, _folder).map(_sortMapper);
    } on Exception catch (e) {
      ref.read(ErrorNotifier.provider.notifier).store(e.toString());
      rethrow;
    }
  }
}
