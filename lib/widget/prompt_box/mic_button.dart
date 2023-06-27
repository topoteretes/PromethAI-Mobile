import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/circle_well.dart';
import 'package:prometh_ai/widget/progress.dart';

class MicButton extends HookConsumerWidget {
  final VoidCallback onStart;
  final VoidCallback onStop;
  final RecordState recordState;

  const MicButton({
    super.key,
    required this.onStart,
    required this.onStop,
    required this.recordState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(duration: A.normal);
    final animation = Tween<double>(begin: 4, end: 8).animate(controller);

    useEffect(() {
      if (recordState == RecordState.recording) {
        controller.repeat(reverse: true);
      } else {
        controller.stop();
      }
      return null;
    }, [recordState]);

    return switch (recordState) {
      RecordState.idle => CircleButton(
          icon: "mic",
          size: 40,
          color: C.front,
          iconSize: 17,
          onPressed: onStart,
        ),
      RecordState.loading => const SizedBox(
          width: 32,
          height: 32,
          child: Center(
            child: SizedBox(
              width: 24,
              height: 24,
              child: Progress(
                color: C.grey,
              ),
            ),
          ),
        ),
      RecordState.recording => CircleWell(
          onTap: onStop,
          child: AnimatedBuilder(
            animation: controller,
            builder: (BuildContext context, Widget? child) => SizedBox(
              width: 40,
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: C.front,
                          blurRadius: animation.value,
                          spreadRadius: animation.value,
                        )
                      ],
                    ),
                  ),
                  const CircleButton(
                    icon: 'mic',
                    color: Colors.red,
                    iconSize: 17,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
        ),
    };
  }
}
