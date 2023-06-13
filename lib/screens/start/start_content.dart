import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/history/history_screen.dart';
import 'package:prometh_ai/screens/setting_screen.dart';
import 'package:prometh_ai/settings.dart';
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
    final pageController = usePageController(initialPage: 1);

    useEffect(() {
      if (pageController.hasClients) {
        final index = getIndex(appState);
        pageController.animateToPage(index, duration: A.normal, curve: CV.normal);
      }

      return null;
    }, [appState]);

    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const SettingScreen(),
              Column(
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
                ],
              ),
              const HistoryScreen()
            ],
          ),
        ),
        const BottomPanel(),
      ],
    );
  }

  getIndex(AppState appState) => switch (appState) {
        AppState.settings => 0,
        AppState.history => 2,
        AppState.historyDetail => 2,
        (_) => 1,
      };
}
