import 'package:flutter/material.dart';
import 'package:prometh_ai/widget/circle_well.dart';

import 'vec_pic.dart';

class CircleButton extends StatelessWidget {
  final String icon;
  final double size;
  final double? iconSize;
  final Color color;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final bool borderOnly;
  final bool enabled;

  const CircleButton({
    super.key,
    this.iconSize,
    this.iconColor,
    this.onPressed,
    required this.icon,
    required this.size,
    required this.color,
    this.borderOnly = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: borderOnly ? Colors.transparent : color,
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: color),
          ),
          child: CircleWell(
            onTap: enabled ? onPressed : null,
            child: VecPic(
              icon,
              color: iconColor,
              iconSize: iconSize ?? size / 4,
            ),
          ),
        ),
      );
}
