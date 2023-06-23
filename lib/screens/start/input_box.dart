import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_button.dart';

class InputBox extends HookConsumerWidget {
  const InputBox({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleButton(icon: "text", size: 64, color: C.white, iconColor: C.front, onPressed: appStateNotifier.inputText),
          CircleButton(icon: "mic", size: 128, color: C.front, onPressed: appStateNotifier.inputVoice),
          const SizedBox(width: 64),
        ],
      ),
    );
  }
}
