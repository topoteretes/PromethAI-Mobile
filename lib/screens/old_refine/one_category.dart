import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/old_refine/one_subtree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';

class OneCategory extends HookConsumerWidget {
  final String category;

  const OneCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tree = ref.watch(TreeNotifier.provider);
    final newPath = ref.watch(PathNotifier.provider.select((s) => s[category] ?? []));
    final previousPath = usePrevious(newPath.join(",")) ?? newPath.join(",");

    final categoryRoot = tree.firstWhere((n) => n.category == category);
    final trees = categoryRoot.getTreeList(newPath);
    final previousTrees = categoryRoot.getTreeList(previousPath.split(","));

    // On back newPath getting sorter and PageView children get shorter suddenly and breaks animation
    final pathToTrees = trees.length < previousTrees.length ? previousTrees : trees;
    final path = trees.length < previousTrees.length ? previousPath.split(",") : newPath;

    final controller = usePageController(initialPage: trees.length - 1);

    useEffect(() {
      if (controller.hasClients) {
        controller.animateToPage(newPath.length, duration: A.normal, curve: CV.normal);
      }
      return null;
    }, [newPath.length]);

    useEffect(() {
      if (controller.hasClients) {
        controller.animateToPage(newPath.length, duration: A.normal, curve: CV.normal);
      }
      return null;
    }, [newPath.length]);

    return ShaderMask(
      shaderCallback: (Rect rect) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [C.back, Colors.transparent, Colors.transparent, C.back],
        stops: [0.0, 0.05, 0.95, 1.0], // 10% purple, 80% transparent, 10% purple
      ).createShader(rect),
      blendMode: BlendMode.dstOut,
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: pathToTrees.mapIndexed((index, t) {
          final pathToRender = path.isNotEmpty ? [...path.sublist(pathToTrees.length - 1 - index)] : <String>[];
          return OneSubTree(tree: t, path: pathToRender);
        }).toList(growable: false),
      ),
    );
  }
}
