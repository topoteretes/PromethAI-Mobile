import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class APage extends Page {
  final Widget child;
  final bool isForward;

  const APage({required this.child, required this.isForward, super.key});

  @override
  Route createRoute(BuildContext context) => PageRouteBuilder(
        settings: this,
        transitionDuration: A.normal,
        reverseTransitionDuration: A.normal,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, isForward ? -1 : 1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: CV.normal,
            ),
          ),
          child: Container(color: t(context).scaffoldBackgroundColor, child: child),
        ),
      );
}

APage pageCreator(
  Widget child, {
  bool fullScreen = false,
  bool isForward = false,
  String? key,
}) =>
    APage(
      key: ValueKey(key ?? child.toStringShort()),
      isForward: isForward,
      child: child,
    );
