import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aicon_button.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';

class GoalSlider extends HookConsumerWidget {
  final Tree node;

  const GoalSlider({
    super.key,
    required this.node,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalNotifier = ref.read(TreeNotifier.provider.notifier);

    onUpdateSlide(double maxWidth) => (double x) => goalNotifier.updateAmount(node.goal.copyWith(amount: _calcValue(x, maxWidth)));

    return Container(
      margin: const EdgeInsets.only(bottom: M.large),
      child: Row(
        children: [
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              final updater = onUpdateSlide(constraints.maxWidth);
              return GestureDetector(
                onPanDown: (details) => updater(details.localPosition.dx),
                onPanUpdate: (details) => updater(details.localPosition.dx),
                child: Stack(
                  children: [
                    Container(
                        height: 65,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: C.front),
                          borderRadius: const BorderRadius.all(Radius.circular(R.normal)),
                        ),
                        child: Center(child: NormalBody(node.name, inverted: false))),
                    ClipRect(
                      child: Align(
                        alignment: Alignment.topLeft,
                        widthFactor: node.amount / 100,
                        child: Container(
                          height: 65,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: C.front,
                            border: Border.all(width: 1, color: C.front),
                            borderRadius: const BorderRadius.all(Radius.circular(R.normal)),
                          ),
                          child: Center(child: NormalBody(node.name, inverted: true)),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
          const SizedBox(width: M.small),
          AIconButton(
            onPressed: () => goalNotifier.goDown(node),
            icon: Icons.keyboard_arrow_down,
            size: 32,
          )
        ],
      ),
    );
  }

  int _calcValue(double x, double maxWidth) => ((x / maxWidth) * 100).round().clamp(0, 100);
}
