import 'package:flutter/widgets.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class GoalTitle extends StatelessWidget {
  final Tree node;
  final bool selected;

  const GoalTitle({super.key, required this.node, required this.selected});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: M.small, right: M.small),
        child: Text(
          node.goal.name,
          style: tt(context).titleLarge!.copyWith(color: selected ? C.front : C.grey),
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      );
}
