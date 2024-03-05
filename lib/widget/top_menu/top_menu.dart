import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/top_category.dart';
import 'package:prometh_ai/state/top_scroll_block.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'top_menu_title.dart';

class TopMenu extends HookConsumerWidget {
  final List<Tree> nodes;
  const TopMenu({super.key, required this.nodes});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topCategoryNotifier = ref.read(TopCategoryNotifier.provider.notifier);
    final topCategory = ref.watch(TopCategoryNotifier.provider);
    final topScrollBlockNotifier = ref.read(TopScrollBlockNotifier.provider.notifier);
    final itemScrollController = useRef(ItemScrollController());

    scrollToItem(int index) {
      final controller = itemScrollController.value;
      if (controller.isAttached) {
        controller.scrollTo(index: index, duration: A.normal, curve: CV.normal);
      } else {
        Timer(A.fast, () => scrollToItem(index));
      }
    }

    useEffect(() {
      final index = nodes.indexWhere((n) => n.category == topCategory);
      scrollToItem(index);
      return null;
    }, [topCategory]);

    return SizedBox(
      height: 24,
      child: Center(
        child: ScrollablePositionedList.builder(
          itemCount: nodes.length,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            final node = nodes[index];
            return InkWell(
              key: ValueKey(node.category),
              onTap: () async {
                topScrollBlockNotifier.block();
                topCategoryNotifier.update(node.category);
                await Future.delayed(A.normal);
                topScrollBlockNotifier.release();
              },
              child: TopMenuTitle(
                node: node,
                selected: node.category == topCategory,
              ),
            );
          },
          itemScrollController: itemScrollController.value,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
