import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseScreen extends HookConsumerWidget {
  final Widget child;
  final Color color;
  final bool bottomPadding;

  const BaseScreen({
    required this.child,
    this.color = Colors.white,
    this.bottomPadding = true,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) =>
      Scaffold(backgroundColor: color, body: SafeArea(bottom: bottomPadding, child: child));
}
