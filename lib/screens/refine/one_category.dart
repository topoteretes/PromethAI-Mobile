import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/refine/one_subtree.dart';
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
    final path = ref.watch(PathNotifier.provider.select((s) => s[category] ?? []));

    final categoryRoot = tree.firstWhere((n) => n.category == category);
    final trees = categoryRoot.getTreeList(path);
    final previousTrees = usePrevious(trees) ?? trees;

    // On back path getting sorter and PageView children get shorter suddenly and breaks animation
    final pathToTrees = trees.length < previousTrees.length ? previousTrees : trees;

    final controller = usePageController(initialPage: trees.length - 1);

    useEffect(() {
      if (controller.hasClients) {
        controller.animateToPage(path.length, duration: A.normal, curve: CV.normal);
      }
      return null;
    }, [path.length]);

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
        children: pathToTrees.mapp((t) => OneSubTree(tree: t)),
      ),
    );
  }
}
