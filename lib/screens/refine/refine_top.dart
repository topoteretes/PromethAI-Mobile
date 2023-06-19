import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/widget/aclose_button.dart';
import 'package:prometh_ai/widget/markup_prompt.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/top_menu/top_menu.dart';
import 'package:prometh_ai/widget/top_view.dart';

class RefineTop extends HookConsumerWidget {
  const RefineTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final prompt = ref.watch(PromptNotifier.provider);
    final tree = ref.watch(TreeNotifier.provider);

    return TopView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ACloseButton(onPressed: appStateNotifier.start),
            ],
          ),
        ),
        RoundCard(
            noMargin: true,
            child: SizedBox(
                height: 80,
                child: Center(
                  child: prompt.updating ? const Progress() : MarkupPrompt(prompt: prompt.current, emphasized: prompt.changed),
                ))),
        if (tree.isNotEmpty) const SizedBox(height: 24),
        tree.isNotEmpty ? TopMenu(nodes: tree) : const SizedBox()
      ],
    ));
  }
}
