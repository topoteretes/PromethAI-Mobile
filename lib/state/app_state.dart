import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/state/deepgram.dart';

import 'prompt.dart';

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
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    deepgramNotifier.stopRecord();
    state = AppState.start;
  }

  refine({String prompt = ""}) {
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    deepgramNotifier.stopRecord();

    state = AppState.refine;
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);
    promptNotifier.refresh(promptMaybe: prompt);
  }

  result() => state = AppState.result;
  inputText() => state = AppState.inputText;
  inputVoice() => state = AppState.inputVoice;
}
