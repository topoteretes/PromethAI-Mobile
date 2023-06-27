import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prometh_ai/theme.dart';
import 'package:vector_graphics/vector_graphics.dart';

class VecPic extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? height;
  final double iconSize;

  const VecPic(
    this.icon, {
    super.key,
    this.height,
    this.color,
    required this.iconSize,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height ?? iconSize,
        child: Center(
          child: SvgPicture(
            colorFilter: ColorFilter.mode(color ?? C.white, BlendMode.srcIn),
            AssetBytesLoader('assets/svgs/$icon.svg.vec'),
            height: iconSize,
          ),
        ),
      );
}
