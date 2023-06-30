import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class CascadingWrapper extends HookConsumerWidget {
  final List<String> path;
  final Widget child;

  const CascadingWrapper({super.key, required this.child, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (path.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: child,
      );
    }
    var wrapped = child;
    var pathCursor = [...path];

    while (pathCursor.isNotEmpty) {
      wrapped = Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: C.front.withOpacity(0.6),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                pathCursor.last,
                style: tt(context).titleMedium!.copyWith(color: C.white),
                softWrap: true,
                maxLines: 3,
              ),
            ),
            wrapped,
          ],
        ),
      );
      pathCursor.removeLast();
    }

    return Container(margin: const EdgeInsets.only(bottom: 16), child: wrapped);
  }
}
