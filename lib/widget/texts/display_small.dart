import 'package:flutter/widgets.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class DisplaySmall extends StatelessWidget {
  final String title;
  const DisplaySmall(this.title, {super.key});

  @override
  Widget build(BuildContext context) => Text(title, style: tt(context).displayMedium);
}
