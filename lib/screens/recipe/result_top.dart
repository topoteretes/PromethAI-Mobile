import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aclose_button.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class ResultTop extends HookConsumerWidget {
  const ResultTop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final prompt = ref.watch(PromptNotifier.provider);

    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Your Meals",
                    style: tt(context).titleMedium!.copyWith(color: C.white),
                  ),
                  ACloseButton(onPressed: appStateNotifier.refine),
                ],
              ),
            ),
            RoundCard(
              noMargin: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      prompt.current,
                      style: tt(context).bodySmall,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: C.front,
                    side: const BorderSide(width: 2.0, color: C.white),
                  ),
                  onPressed: () => appStateNotifier.refine(),
                  child: Text(
                    "Change preferences",
                    style: tt(context).bodyMedium!.copyWith(color: C.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
