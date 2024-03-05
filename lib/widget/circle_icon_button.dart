import 'package:flutter/material.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/widget/circle_well.dart';

import '../theme.dart';

const _size = 20.0;

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Color? iconColor;
  final VoidCallback? onPressed;
  final double? size;
  final double? iconSize;
  final bool hasBorder;

  const CircleIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color = C.front,
    this.iconColor,
    this.size = _size,
    this.iconSize = _size,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 2, color: hasBorder ? C.front : Colors.transparent),
          borderRadius: const BorderRadius.all(Radius.circular(R.xxx)),
        ),
        alignment: Alignment.center,
        child: CircleWell(
            onTap: onPressed,
            child: Icon(
              icon,
              size: iconSize,
              color: iconColor,
            )),
      );
}
