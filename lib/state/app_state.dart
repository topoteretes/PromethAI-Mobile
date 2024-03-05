import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:prometh_ai/state/deepgram.dart';

import 'prompt.dart';
import 'tree.dart';

enum AppState {
  start,
  settings,
  refine,
  recipe,
  recipeDetail,
  history,
  historyDetail,
  scheduleLater,
  warning,
}

class AppStateNotifier extends StateNotifier<AppState> {
  static final provider = StateNotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);
  final Ref ref;

  AppStateNotifier(this.ref) : super(AppState.start);

  start() {
    _stopRecord();
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);
    treeNotifier.cleanup();
    state = AppState.start;
  }

  refine() {
    _stopRecord();

    state = AppState.refine;
  }

  prefetchTree({String prompt = "", bool userDefaults = true}) {
    _stopRecord();
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);
    treeNotifier.refresh(promptMaybe: prompt, userDefaults: userDefaults);
  }

  _stopRecord() {
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    deepgramNotifier.stopRecord();
  }

  recipe() {
    final prompt = ref.read(PromptNotifier.provider);
    Segment.track(eventName: 'Request meals', properties: {'prompt': prompt.current});
    state = AppState.recipe;
  }

  recipeDetail() => state = AppState.recipeDetail;
  historyDetail() => state = AppState.historyDetail;
  scheduleLater() => state = AppState.scheduleLater;
  history() => state = AppState.history;
  settings() => state = AppState.settings;
  warning() => state = AppState.warning;
}
