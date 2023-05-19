import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.only(bottom: M.small),
        margin: const EdgeInsets.only(left: M.small, right: M.small),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(
            color: selected ? C.back : C.front,
            width: 4,
          ),
        )),
        child: Text(
          node.goal.name,
          style: tt(context).titleLarge!.copyWith(fontWeight: selected ? FontWeight.w700 : FontWeight.normal),
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      );
}
