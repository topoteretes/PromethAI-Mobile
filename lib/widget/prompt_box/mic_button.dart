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
  final bool enabled;

  const MicButton({
    super.key,
    required this.onStart,
    required this.onStop,
    required this.recordState,
    required this.enabled,
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

    return Opacity(
      opacity: enabled ? 1 : 0.5,
      child: switch (recordState) {
        RecordState.idle => CircleButton(
            icon: "mic",
            size: 56,
            color: C.front,
            iconSize: 24,
            onPressed: enabled ? onStart : null,
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
                width: 56,
                height: 56,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        boxShadow: [
                          BoxShadow(
                            color: C.front.withOpacity(0.5),
                            blurRadius: animation.value,
                            spreadRadius: animation.value,
                          )
                        ],
                      ),
                    ),
                    const CircleButton(
                      icon: 'pause',
                      color: C.front,
                      iconSize: 24,
                      size: 56,
                    ),
                  ],
                ),
              ),
            ),
          ),
      },
    );
  }
}
