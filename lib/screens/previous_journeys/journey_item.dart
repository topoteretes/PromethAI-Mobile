import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/journey.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/texts/date_label.dart';
import 'package:prometh_ai/widget/texts/journey_title.dart';

class JourneyItem extends HookConsumerWidget {
  final Journey journey;

  const JourneyItem({super.key, required this.journey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(M.small),
      margin: const EdgeInsets.only(top: M.small, bottom: M.small),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: C.front),
        borderRadius: const BorderRadius.all(Radius.circular(R.normal)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JourneyTitle(journey.path.join(" > ")),
          const SizedBox(height: M.small),
          DateLabel(timestamp: journey.modified),
        ],
      ),
    );
  }
}
