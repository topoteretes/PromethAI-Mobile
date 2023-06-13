import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';

class ACloseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const ACloseButton({super.key, required this.onPressed, this.color = C.white});

  @override
  Widget build(BuildContext context) => IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: Icon(
        Icons.close,
        color: color,
        size: 28,
      ));
}
