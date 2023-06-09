import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/top_menu/top_menu.dart';

class RefineTop extends HookConsumerWidget {
  const RefineTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final prompt = ref.watch(PromptNotifier.provider);
    final tree = ref.watch(TreeNotifier.provider);
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        color: C.front,
      ),
      child: SafeArea(
        bottom: false,
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
/*                  Text(
                    "Goal: Quick veggie meal",
                    style: tt(context).titleMedium!.copyWith(color: C.white),
                  ),*/
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: appStateNotifier.start,
                      icon: const Icon(
                        Icons.close,
                        color: C.white,
                        size: 28,
                      )),
                ],
              ),
            ),
            RoundCard(
              noMargin: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 310,
                    ),
                    child: Text(
                      prompt,
                      style: tt(context).bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            if (tree.isNotEmpty) const SizedBox(height: 24),
            tree.isNotEmpty ? TopMenu(nodes: tree) : const SizedBox()
          ],
        ),
      ),
    );
  }
}
