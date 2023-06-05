import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';

import 'bottom_panel.dart';
import 'example_card.dart';
import 'input_box.dart';
import 'input_card.dart';
import 'welcome_card.dart';

class StartContent extends HookConsumerWidget {
  const StartContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(AppStateNotifier.provider);

    return Column(
      children: [
        const SizedBox(height: 24),
        const WelcomeCard(),
        const Spacer(),
        if (appState == AppState.start) const ExampleCard(),
        if (appState == AppState.inputText) const InputCard(),
        if (appState == AppState.inputVoice) const InputCard(),
        const SizedBox(height: 8),
        const InputBox(),
        const SizedBox(height: 48),
        const BottomPanel(),
      ],
    );
  }
}
