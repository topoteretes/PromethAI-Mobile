import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'top_menu_title.dart';

class TopMenu extends HookConsumerWidget {
  final List<String> path;
  const TopMenu({super.key, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathNotifier = ref.read(PathNotifier.provider.notifier);

    final tree = ref.watch(TreeNotifier.provider);
    final selectedGoal = tree.findSelected(path);
    final menuGoals = tree.findMenu(path);
    final itemScrollController = useRef(ItemScrollController());

    scrollToItem(int index) {
      final controller = itemScrollController.value;
      if (controller.isAttached) {
        controller.scrollTo(index: index, duration: A.normal, curve: Curves.easeInOut);
      } else {
        Timer(A.fast, () => scrollToItem(index));
      }
    }

    useEffect(() {
      final index = menuGoals.indexOf(selectedGoal);
      scrollToItem(index);
      return null;
    }, []);

    return Container(
      height: 48,
      color: C.front,
      child: Center(
        child: ScrollablePositionedList.builder(
          itemCount: menuGoals.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final goal = menuGoals[index];
            return InkWell(
              key: ValueKey(goal.goal.name),
              onTap: () => pathNotifier.change(goal.name),
              child: TopMenuTitle(node: goal, selected: selectedGoal.goal == goal.goal),
            );
          },
          itemScrollController: itemScrollController.value,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
