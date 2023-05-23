import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/journey.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/widget/texts/journey_title.dart';

class JourneyItem extends HookConsumerWidget {
  final Journey journey;

  const JourneyItem({super.key, required this.journey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JourneyTitle(journey.path.join(" > ")),
        const SizedBox(height: M.small),
      ],
    );
  }
}
