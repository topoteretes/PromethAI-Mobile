import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prometh_ai/settings.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../theme.dart';

const _size = 20.0;

class SVGButton extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback? onPressed;
  final double? size;
  final double? iconSize;
  final bool hasBorder;

  const SVGButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.color = C.front,
    this.size = _size,
    this.iconSize = _size,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) => ClipRect(
        child: Container(
          width: size,
          height: size,
          margin: const EdgeInsets.only(right: M.normal),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: hasBorder ? C.front2 : Colors.transparent),
            borderRadius: const BorderRadius.all(Radius.circular(R.xxx)),
          ),
          alignment: Alignment.center,
          child: InkWell(
            onTap: onPressed,
            child: SvgPicture(
              AssetBytesLoader(icon),
              colorFilter: ColorFilter.mode(color, BlendMode.color),
              height: iconSize,
            ),
          ),
        ),
      );
}
