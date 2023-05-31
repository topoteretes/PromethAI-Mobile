import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/svg_button.dart';

class MicButton extends HookConsumerWidget {
  final VoidCallback onStart;
  final RecordState recordState;

  const MicButton({
    super.key,
    required this.onStart,
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

    switch (recordState) {
      case RecordState.idle:
        return SVGButton(
          onPressed: onStart,
          icon: 'assets/svgs/mic.svg.vec',
          color: C.grey,
          iconSize: 17,
          size: 32,
        );
      case RecordState.loading:
        return const SizedBox(
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
        );
      case RecordState.recording:
        return AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget? child) => SizedBox(
            width: 32,
            height: 32,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
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
                const SVGButton(
                  onPressed: null,
                  icon: 'assets/svgs/mic_white.svg.vec',
                  color: Colors.red,
                  iconSize: 17,
                  size: 32,
                ),
              ],
            ),
          ),
        );
    }
  }
}
