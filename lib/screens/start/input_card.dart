import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/string_ext.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/widget/prompt_box/prompt_box.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

class InputCard extends HookConsumerWidget {
  const InputCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final deepgram = ref.watch(DeepgramNotifier.provider);
    return Column(
      children: [
        RoundCard(
          child: Column(
            children: [
              const PromptBox(title: "Ask something"),
              const SizedBox(height: 11),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: Opacity(
                  opacity: deepgram.isBlank ? 0.5 : 1,
                  child: OutlinedButton(
                      onPressed: deepgram.isBlank ? null : () => appStateNotifier.refine(prompt: deepgram),
                      child: Text(
                        'Go deeper',
                        style: tt(context).bodyMedium,
                      )),
                ),
              ),
            ],
          ),
        ),
        const VecPic(
          "triangle",
          iconSize: 18,
          height: 18,
        ),
      ],
    );
  }
}
