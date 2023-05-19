import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aicon_button.dart';
import 'package:prometh_ai/widget/pill_button.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';
import 'package:prometh_ai/widget/texts/select.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class GoalSlider extends HookConsumerWidget {
  final Tree node;
  final bool isSelect;

  const GoalSlider({
    super.key,
    required this.node,
    required this.isSelect,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);
    final userInitiated = useState(false);
    final prevValue = usePrevious(node.goal.amount);
    onUpdateSlide(double maxWidth) => (double x) {
          userInitiated.value = true;
          treeNotifier.updateAmount(node.goal.copyWith(amount: _calcValue(x, maxWidth)));
        };

    final width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.only(bottom: M.large),
      child: Row(
        children: [
          AnimatedContainer(
            width: isSelect ? width - M.small * 2 - 33 * 2 - M.normal * 2 : 100,
            duration: A.fast,
            child: PillButton(
              title: node.name,
              onPressed: () => treeNotifier.updateAmount(node.goal.copyWith(amount: _calcToggleAmount(prevValue))),
              isDisabled: node.amount == 0,
            ),
          ),
          const SizedBox(width: M.small),
          AnimatedCrossFade(
            crossFadeState: isSelect ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: A.fast,
            firstChild: Select(
                selected: node.amount == 100,
                onChange: (selected) => treeNotifier.updateAmount(node.goal.copyWith(amount: selected ? 100 : 0))),
            secondChild: SizedBox(
              width: width - 100 - M.small * 2 - 33 - M.normal * 2,
              child: LayoutBuilder(builder: (context, constraints) {
                final updater = onUpdateSlide(constraints.maxWidth);
                return GestureDetector(
                  onPanDown: (details) => updater(details.localPosition.dx),
                  onPanUpdate: (details) => updater(details.localPosition.dx),
                  onPanCancel: () => userInitiated.value = false,
                  onPanEnd: (_) => userInitiated.value = false,
                  child: Stack(
                    children: [
                      _renderRow(context, false),
                      ClipRect(
                        child: AnimatedAlign(
                          duration: userInitiated.value ? Duration.zero : A.fast,
                          alignment: Alignment.topLeft,
                          widthFactor: node.amount / 100,
                          child: _renderRow(context, true),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          const SizedBox(width: M.small),
          AIconButton(
            onPressed: () => treeNotifier.goDown(node),
            icon: Icons.keyboard_arrow_down,
            hasBorder: true,
            color: C.grey,
            size: 32,
          )
        ],
      ),
    );
  }

  int _calcToggleAmount(int? prevValue) {
    if (node.amount > 0) {
      return 0;
    }
    if (isSelect) {
      return 100;
    }
    if (prevValue == null || prevValue == 0) {
      return 50;
    }

    return prevValue;
  }

  Widget _renderRow(BuildContext context, bool inverted) => Container(
      height: 33,
      width: double.infinity,
      decoration: BoxDecoration(
        color: inverted ? C.front : Colors.white,
        border: Border.all(width: 2, color: inverted ? C.front : C.grey4),
        borderRadius: const BorderRadius.all(Radius.circular(R.xxx)),
      ),
      child: Center(
        child: Text(
          "${node.amount}%",
          textAlign: TextAlign.center,
          style: tt(context).displayMedium!.copyWith(height: 1, color: inverted ? C.back : C.grey),
        ),
      ));

  int _calcValue(double x, double maxWidth) => ((x / maxWidth) * 100).round().clamp(0, 100);
}
