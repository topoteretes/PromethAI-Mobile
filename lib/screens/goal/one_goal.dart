import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/goal/goal_slider.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/widget/progress.dart';

class OneGoal extends HookConsumerWidget {
  final Tree node;
  final bool isSelect;

  const OneGoal({super.key, required this.node, required this.isSelect});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        padding: const EdgeInsets.only(left: M.normal, right: M.normal),
        child: (node.children.isEmpty)
            ? const Center(child: Progress())
            : ListView(shrinkWrap: true, children: node.children.mapp((n) => GoalSlider(node: n, isSelect: isSelect))),
      );
}
