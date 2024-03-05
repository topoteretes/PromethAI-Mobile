import 'package:flutter/widgets.dart';

class BottomRoundCard extends StatelessWidget {
  final Widget child;
  const BottomRoundCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) => ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(32),
        bottomRight: Radius.circular(32),
      ),
      child: child);
}
