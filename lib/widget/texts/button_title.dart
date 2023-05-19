import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class ButtonTitle extends StatelessWidget {
  final String title;
  final bool inverted;
  const ButtonTitle(this.title, {super.key, this.inverted = false});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).titleSmall!.copyWith(color: inverted ? C.back : C.front),
        textAlign: TextAlign.center,
      );
}
