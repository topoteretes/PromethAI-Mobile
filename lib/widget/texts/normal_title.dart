import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class NormalTitle extends StatelessWidget {
  final String title;
  final bool inverted;

  const NormalTitle(this.title, {super.key, this.inverted = false});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).titleLarge!.copyWith(color: inverted ? C.back : C.front),
        softWrap: false,
        overflow: TextOverflow.fade,
      );
}
