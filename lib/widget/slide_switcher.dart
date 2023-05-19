import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class InvertedCircleClipper extends CustomClipper<Path> {
  final double value;

  InvertedCircleClipper(this.value);

  @override
  Path getClip(Size size) {
    final w = size.width / 2;
    return Path()
      ..addRRect(RRect.fromLTRBR(2 + w * value, 2, w + w * value - 2, size.height - 2, const Radius.circular(16)))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class SlideSwitcherOption<T> {
  final String title;
  final T value;

  const SlideSwitcherOption(this.title, this.value);
}

class SlideSwitcher<T> extends HookConsumerWidget {
  final List<SlideSwitcherOption<T>> options;
  final void Function(T) onChange;

  const SlideSwitcher({super.key, required this.options, required this.onChange});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);
    final controller = useAnimationController(duration: A.fast);
    final animation = Tween<double>(begin: 0, end: 1).animate(controller);

    useEffect(() {
      if (selectedIndex.value == 1) {
        controller.forward(from: 0);
      } else {
        controller.reverse(from: 1);
      }
      onChange(selectedIndex.value as T);
      return null;
    }, [selectedIndex.value]);

    return SizedBox(
      height: 33,
      child: Stack(
        alignment: Alignment.centerLeft,
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              color: C.grey2,
              border: Border.all(width: 1, color: C.grey2),
              borderRadius: const BorderRadius.all(Radius.circular(R.xxx)),
            ),
            child: Row(
              children: options
                  .mapIndexed((index, t) => Expanded(
                        flex: 1,
                        child: InkWell(
                          hoverColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () => selectedIndex.value = index,
                          child: SizedBox(
                            height: 33,
                            child: Center(
                              child: Text(
                                t.title,
                                textAlign: TextAlign.center,
                                style: tt(context).displayMedium!.copyWith(height: 1, color: C.grey3, fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(growable: false),
            ),
          ),
          IgnorePointer(
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, anim) => ClipPath(
                clipper: InvertedCircleClipper(animation.value),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: const BorderRadius.all(Radius.circular(R.xxx)),
                  ),
                  child: Row(
                    children: options
                        .mapIndexed((index, t) => Expanded(
                              flex: 1,
                              child: Text(
                                t.title,
                                textAlign: TextAlign.center,
                                style: tt(context).displayMedium!.copyWith(height: 1, color: C.front),
                              ),
                            ))
                        .toList(growable: false),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
