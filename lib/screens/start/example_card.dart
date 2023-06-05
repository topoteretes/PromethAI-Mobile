import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

const _examplePrompt = 'I’d like a quick veggie meal under \$25 near me. No peanuts, I’m allergic.';

class ExampleCard extends HookConsumerWidget {
  const ExampleCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    return Column(
      children: [
        RoundCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_examplePrompt, style: tt(context).bodySmall),
              const SizedBox(height: 11),
              SizedBox(
                height: 40,
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () => appStateNotifier.refine(prompt: _examplePrompt),
                    child: Text(
                      'Try the example',
                      style: tt(context).bodyMedium,
                    )),
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
