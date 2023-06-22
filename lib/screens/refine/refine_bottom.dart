import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/round_button.dart';

class RefineBottom extends HookConsumerWidget {
  const RefineBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(selectedPath);
    final pathNotifier = ref.read(PathNotifier.provider.notifier);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      margin: const EdgeInsets.only(top: 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: C.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x19000000),
            offset: Offset(0, -2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        children: [
          AnimatedPadding(
              duration: A.fast,
              curve: CV.normal,
              padding: path.isNotEmpty ? const EdgeInsets.only(left: 62) : EdgeInsets.zero,
              child: RoundButton(
                title: "Show meals",
                onPressed: appStateNotifier.result,
              )),
          AnimatedPositioned(
            duration: A.fast,
            curve: CV.normal,
            left: path.isNotEmpty ? 0 : -62,
            child: AnimatedOpacity(
              duration: A.fast,
              curve: CV.normal,
              opacity: path.isNotEmpty ? 1 : 0,
              child: CircleButton(
                icon: "up_arrow",
                size: 48,
                color: C.front,
                iconColor: C.front,
                iconSize: 12,
                borderOnly: true,
                onPressed: () {
                  pathNotifier.back();
                  promptNotifier.rewrite();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
