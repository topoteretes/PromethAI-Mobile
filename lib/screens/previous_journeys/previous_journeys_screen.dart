import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/previous_journeys/journey_item.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/journey.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/base_screen.dart';
import 'package:prometh_ai/widget/confirm_dialog.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

class PreviousJourneysScreen extends HookConsumerWidget {
  const PreviousJourneysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeyNotifier = ref.read(JourneyNotifier.provider.notifier);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final journey = ref.watch(JourneyNotifier.provider);

    return BaseScreen(
      bottomPadding: false,
      child: Padding(
        padding: const EdgeInsets.all(M.normal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const NormalTitle("Previous Journeys"),
            const SizedBox(height: M.normal),
            if (journey.isNotEmpty)
              Expanded(
                child: ListView(
                  children: journey.mapp((j) => InkWell(
                        onTap: () => journeyNotifier.resume(j),
                        child: JourneyItem(journey: j),
                      )),
                ),
              ),
            if (journey.isEmpty) const Expanded(child: Center(child: NormalTitle("You have no saved journeys."))),
            if (journey.isNotEmpty)
              AButton(onPressed: () => confirmDialog(context, onSure: journeyNotifier.deleteAll), title: "Delete all"),
            AButton(
              onPressed: appStateNotifier.start,
              title: "Back",
              inverted: true,
            ),
          ],
        ),
      ),
    );
  }
}
