import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RefineProgress extends HookConsumerWidget {
  const RefineProgress({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(PromptNotifier.provider);
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Progress(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'We are talking to the AI and asking for decision points for your query: \n\n "${prompt.prompt}".\n\n Just a couple of seconds!',
                    textStyle: tt(context).titleSmall!.copyWith(height: 1.5),
                    textAlign: TextAlign.center,
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                totalRepeatCount: 400,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: false,
                stopPauseOnTap: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
