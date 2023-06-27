import 'package:flutter/material.dart';

class CircleWell extends InkWell {
  const CircleWell({super.key, super.child, super.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(300),
        onTap: onTap,
        child: child,
      );
}
