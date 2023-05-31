import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';

class Progress extends StatelessWidget {
  final bool inverted;
  final Color? color;

  const Progress({super.key, this.inverted = false, this.color});

  @override
  Widget build(BuildContext context) => CircularProgressIndicator(
        color: color ?? (inverted ? C.back : C.front),
        strokeWidth: 4,
      );
}
