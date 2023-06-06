import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/refine/one_category.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/state/top_category.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RefineBody extends HookConsumerWidget {
  const RefineBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(PromptNotifier.provider);
    final topCategory = ref.watch(TopCategoryNotifier.provider);
    final controller = usePageController();

    useEffect(() {
      if (controller.hasClients) {
        final index = prompt.tree.indexWhere((n) => n.category == topCategory);
        controller.animateToPage(index, duration: A.normal, curve: CV.normal);
      }
      return null;
    }, [topCategory]);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Text(
                "Choose one option",
                style: tt(context).labelMedium,
              ),
            ),
            Expanded(
              child: PageView(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                children: prompt.tree.mapp((c) => OneCategory(category: c.category)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
