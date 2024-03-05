import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class ItalicTitle extends StatelessWidget {
  final String title;

  const ItalicTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).bodyLarge!.copyWith(color: C.grey3, fontStyle: FontStyle.italic),
      );
}
