import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:prometh_ai/state/deepgram.dart';

import 'prompt.dart';
import 'tree.dart';

enum AppState {
  start,
  inputText,
  inputVoice,
  settings,
  history,
  historyDetail,
  refine,
  recipe,
  recipeDetail,
  scheduleLater,
}

class AppStateNotifier extends StateNotifier<AppState> {
  static final provider = StateNotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);
  final Ref ref;

  AppStateNotifier(this.ref) : super(AppState.start);

  start() {
    _stopRecord();
    state = AppState.start;
  }

  refine({String prompt = ""}) {
    _stopRecord();
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);
    treeNotifier.refresh(promptMaybe: prompt);
    state = AppState.refine;
  }

  _stopRecord() {
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    deepgramNotifier.stopRecord();
  }

  result() {
    final prompt = ref.read(PromptNotifier.provider);
    Segment.track(eventName: 'Request meals', properties: {'prompt': prompt.current});
    state = AppState.recipe;
  }

  inputText() => state = AppState.inputText;
  inputVoice() => state = AppState.inputVoice;
  recipeDetail() => state = AppState.recipeDetail;
  historyDetail() => state = AppState.historyDetail;
  scheduleLater() => state = AppState.scheduleLater;
  history() => state = AppState.history;
  settings() => state = AppState.settings;
}
