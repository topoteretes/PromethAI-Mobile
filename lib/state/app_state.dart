import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'prompt.dart';

enum AppState {
  start,
  inputText,
  inputVoice,
  refine,
  result,
  recipeDetail,
}

class AppStateNotifier extends StateNotifier<AppState> {
  static final provider = StateNotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);
  final Ref ref;

  AppStateNotifier(this.ref) : super(AppState.start);

  start() => state = AppState.start;
  refine({String prompt = ""}) {
    state = AppState.refine;
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);
    promptNotifier.refresh(prompt: prompt);
  }

  result() => state = AppState.result;
  inputText() => state = AppState.inputText;
  inputVoice() => state = AppState.inputVoice;
  recipeDetail() => state = AppState.recipeDetail;
}
