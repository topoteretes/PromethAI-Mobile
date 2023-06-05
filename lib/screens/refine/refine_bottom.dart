import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/round_button.dart';

class RefineBottom extends HookConsumerWidget {
  const RefineBottom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(selectedPath);
    final pathNotifier = ref.read(PathNotifier.provider.notifier);
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      margin: const EdgeInsets.only(top: 24),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (path.isNotEmpty)
            CircleButton(
              icon: "up_arrow",
              size: 64,
              color: C.front,
              iconColor: C.front,
              iconSize: 12,
              borderOnly: true,
              onPressed: pathNotifier.back,
            ),
          if (path.isNotEmpty) const SizedBox(width: 16),
          Expanded(child: RoundButton(title: "Show meals", onPressed: () {})),
        ],
      ),
    );
  }
}
