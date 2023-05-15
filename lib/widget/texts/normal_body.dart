import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class NormalBody extends StatelessWidget {
  final String title;
  final bool inverted;
  final Color? color;

  const NormalBody(
    this.title, {
    super.key,
    this.inverted = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).bodyMedium!.copyWith(color: color ?? (inverted ? C.back : C.front)),
        softWrap: false,
        overflow: TextOverflow.fade,
      );
}
