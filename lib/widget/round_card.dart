import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';

class RoundCard extends StatelessWidget {
  final Widget child;
  final bool noMargin;

  const RoundCard({super.key, required this.child, this.noMargin = false});

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Container(
          margin: noMargin ? EdgeInsets.zero : const EdgeInsets.fromLTRB(24, 0, 24, 0),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: C.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: C.borderGrey,
                offset: Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: child,
        ),
      );
}
