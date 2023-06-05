import 'package:flutter/widgets.dart';
import 'package:prometh_ai/settings.dart';

class CrossFade extends StatelessWidget {
  final bool isFirstVisible;
  final Widget firstChild;
  final Widget secondChild;

  const CrossFade({
    super.key,
    required this.isFirstVisible,
    required this.firstChild,
    required this.secondChild,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: firstChild,
      secondChild: secondChild,
      crossFadeState: isFirstVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: A.fast,
      layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) => Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            key: bottomChildKey,
            child: bottomChild,
          ),
          Positioned(
            key: topChildKey,
            child: topChild,
          ),
        ],
      ),
    );
  }
}
