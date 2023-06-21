import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/widget/option_row.dart';

class ScopeContent extends HookConsumerWidget {
  const ScopeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OptionRow(
              selected: true,
              disabled: false,
              title: "Meal Assist",
              onSelect: appStateNotifier.start,
              onDetail: appStateNotifier.start,
            ),
            const OptionRow(selected: false, disabled: true, title: "Hydration Assist"),
            const OptionRow(selected: false, disabled: true, title: "Marathon Assist"),
            const Spacer(),
            /* const PromptBox(title: 'Set goal'),
            const SizedBox(height: 24)*/
          ],
        ),
      ),
    );
  }
}
