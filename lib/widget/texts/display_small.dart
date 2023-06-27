import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class DisplaySmall extends StatelessWidget {
  final String title;
  final bool inverted;
  const DisplaySmall(this.title, {super.key, this.inverted = false});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).displayMedium!.copyWith(color: inverted ? C.grey : C.back),
        textAlign: TextAlign.center,
        softWrap: false,
        maxLines: 2,
      );
}
