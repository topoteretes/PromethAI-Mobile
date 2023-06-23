import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/scope.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

class MainMenu extends HookConsumerWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scopeVisible = ref.watch(ScopeNotifier.provider);
    final scopeNotifier = ref.read(ScopeNotifier.provider.notifier);

    final controller = useAnimationController(duration: A.fast);
    final animation = Tween(begin: 0.0, end: 1.0).animate(controller);

    useEffect(() {
      if (scopeVisible) {
        controller.reverse(from: 1);
      } else {
        controller.forward(from: 0);
      }
      return null;
    }, [scopeVisible]);

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedCrossFade(
            firstChild: const VecPic(
              "meal_assist",
              iconSize: 22,
              color: C.front,
            ),
            secondChild: const VecPic(
              "prometh_ai",
              iconSize: 22,
              color: C.front,
            ),
            alignment: Alignment.centerLeft,
            crossFadeState: scopeVisible ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: A.fast,
            layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) => Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
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
          ),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: scopeNotifier.toggle,
              icon: AnimatedIcon(
                color: C.front,
                size: 28,
                icon: AnimatedIcons.close_menu,
                progress: animation,
              )),
        ],
      ),
    );
  }
}
