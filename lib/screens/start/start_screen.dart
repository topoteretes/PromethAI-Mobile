import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/journey.dart';
import 'package:prometh_ai/state/selected_journey.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/base_screen.dart';
import 'package:prometh_ai/widget/prompt_box.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeyNotifier = ref.read(JourneyNotifier.provider.notifier);
    final selectedJourneyNotifier = ref.watch(SelectedJourneyNotifier.provider.notifier);

    return BaseScreen(
        child: Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: M.normal, right: M.normal),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 38),
          const NormalTitle("PromethAI"),
          const Spacer(),
          AButton(onPressed: journeyNotifier.startNew, title: "Start Blank"),
          AButton(onPressed: selectedJourneyNotifier.open, title: "Previous Journeys", inverted: true),
          const Spacer(),
          const PromptBox(title: "Show us what you’ve got at home!"),
        ],
      ),
    ));
  }
}
