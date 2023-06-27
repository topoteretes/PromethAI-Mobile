import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';

class BottomView extends StatelessWidget {
  final Widget child;

  const BottomView({super.key, required this.child});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        margin: const EdgeInsets.only(top: 0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          color: C.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              offset: Offset(0, -2),
              blurRadius: 4,
            ),
          ],
        ),
        child: child,
      );
}
