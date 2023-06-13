import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/widget/aclose_button.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/top_menu/top_menu.dart';
import 'package:prometh_ai/widget/top_view.dart';

class RefineTop extends HookConsumerWidget {
  const RefineTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final prompt = ref.watch(PromptNotifier.provider);
    final tree = ref.watch(TreeNotifier.provider);

    return AnimatedSize(
      duration: A.fast,
      alignment: Alignment.topCenter,
      child: TopView(
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
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 310,
              ),
              child: prompt.updating
                  ? const Center(child: Progress())
                  : Text(
                      prompt.current,
                      style: tt(context).bodySmall,
                    ),
            ),
          ),
          if (tree.isNotEmpty) const SizedBox(height: 24),
          tree.isNotEmpty ? TopMenu(nodes: tree) : const SizedBox()
        ],
      )),
    );
  }
}
