import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';

class TopView extends StatelessWidget {
  final Widget child;

  const TopView({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(32),
            bottomRight: Radius.circular(32),
          ),
          color: C.front,
        ),
        child: SafeArea(
          bottom: false,
          child: child,
        ),
      );
}
