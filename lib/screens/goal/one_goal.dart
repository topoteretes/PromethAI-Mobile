import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/goal/goal_slider.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';

class OneGoal extends HookConsumerWidget {
  final Tree node;

  const OneGoal({super.key, required this.node});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        color: C.grey3,
        padding: const EdgeInsets.all(M.normal),
        child: Column(
          children: [
            if (node.children.isEmpty) const ExCentProgress(),
            if (node.children.isNotEmpty) ...(node.children.mapp((n) => GoalSlider(node: n))),
          ],
        ),
      );
}
