import 'package:flutter_riverpod/flutter_riverpod.dart';

class PromptNotifier extends StateNotifier<String> {
  final Ref ref;
  static final provider = StateNotifierProvider<PromptNotifier, String>(PromptNotifier.new);

  PromptNotifier(this.ref) : super("");

  store(String newPrompt) => state = newPrompt;

  rewrite(from, String preference) => state = state.replaceAll(from, preference);
}
