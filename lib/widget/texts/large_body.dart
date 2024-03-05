import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class LargeBody extends StatelessWidget {
  final String title;
  final bool inverted;
  final Color? color;
  final bool bold;

  const LargeBody(
    this.title, {
    super.key,
    this.inverted = false,
    this.color,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context)
            .bodyLarge!
            .copyWith(color: color ?? (inverted ? C.back : C.black), fontWeight: bold ? FontWeight.bold : FontWeight.normal),
        softWrap: true,
        textAlign: TextAlign.center,
      );
}
