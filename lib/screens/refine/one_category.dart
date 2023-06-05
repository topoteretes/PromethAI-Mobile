import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/refine/one_subtree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/prompt.dart';

class OneCategory extends HookConsumerWidget {
  final String category;

  const OneCategory({super.key, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(PromptNotifier.provider);
    final path = ref.watch(PathNotifier.provider.select((s) => s[category] ?? []));

    final categoryRoot = prompt.tree.firstWhere((n) => n.category == category);
    final trees = categoryRoot.getTreeList(path);
    final controller = usePageController(initialPage: trees.length, keepPage: false);

    useEffect(() {
      if (controller.hasClients) {
        controller.animateToPage(path.length, duration: A.normal, curve: CV.normal);
      }
      return null;
    }, [path.length]);

    return PageView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      children: trees.mapp((t) => OneSubTree(tree: t)),
    );
  }
}
