import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class TopMenuTitle extends StatelessWidget {
  final Tree node;
  final bool selected;

  const TopMenuTitle({
    super.key,
    required this.node,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) => Container(
        alignment: Alignment.center,
        height: 24,
        padding: const EdgeInsets.only(left: M.small, right: M.small, bottom: 2),
        margin: const EdgeInsets.only(left: M.tiny, right: M.tiny),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: selected ? C.white : C.front,
            border: Border.all(color: selected ? C.white : C.front, width: 1)),
        child: Text(
          node.category.toUpperCase(),
          style: tt(context).bodySmall!.copyWith(
                color: selected ? C.front : C.white,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                //height: 1,
              ),
          softWrap: false,
          overflow: TextOverflow.fade,
        ),
      );
}
