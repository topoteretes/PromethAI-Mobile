import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/state/deepgram.dart';

import 'tree.dart';

enum AppState {
  start,
  inputText,
  inputVoice,
  refine,
  result,
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

  result() => state = AppState.result;
  inputText() => state = AppState.inputText;
  inputVoice() => state = AppState.inputVoice;
}
