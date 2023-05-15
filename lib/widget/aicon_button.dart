import 'package:flutter/material.dart';

import '../theme.dart';

const _size = 20.0;

class AIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  final double? size;

  const AIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color = C.front,
    this.size = _size,
  });

  @override
  Widget build(BuildContext context) => ClipRect(
        child: Transform.translate(
          offset: const Offset(0, 0),
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            child: InkWell(
                onTap: onPressed,
                child: Icon(
                  icon,
                  size: size,
                  color: color,
                )),
          ),
        ),
      );
}
