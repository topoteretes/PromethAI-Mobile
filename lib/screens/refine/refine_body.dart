import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/old_refine/one_category.dart';
import 'package:prometh_ai/screens/old_refine/refine_progress.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/state/top_scroll_block.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/state/top_category.dart';
import 'package:prometh_ai/widget/asmall_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RefineBody extends HookConsumerWidget {
  const RefineBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topCategoryNotifier = ref.read(TopCategoryNotifier.provider.notifier);
    final tree = ref.watch(TreeNotifier.provider);
    final topCategory = ref.watch(TopCategoryNotifier.provider);
    final categoryFetched = ref.watch(CategoryFetchedNotifier.provider);
    final controller = usePageController();
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final prompt = ref.watch(PromptNotifier.provider.select((p) => p.current));

    useEffect(() {
      if (controller.hasClients) {
        final index = tree.indexWhere((n) => n.category == topCategory);
        controller.animateToPage(index, duration: A.normal, curve: CV.normal);
      }
      return null;
    }, [topCategory]);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Text("Choose options", style: tt(context).labelMedium),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    width: 100,
                    child: ASmallButton(
                      title: "Refine",
                      enabled: prompt != "",
                      onPressed: () {
                        final treeNotifier = ref.read(TreeNotifier.provider.notifier);
                        treeNotifier.cleanup();
                        appStateNotifier.prefetchTree(prompt: prompt, userDefaults: false);
                        appStateNotifier.refine();
                      },
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (page) {
                  final topScrollBlock = ref.read(TopScrollBlockNotifier.provider);
                  if (topScrollBlock) {
                    return;
                  }
                  topCategoryNotifier.update(tree[page].category);
                },
                children: tree.mapp((c) => OneCategory(category: c.category)),
              ),
            ),
            if (!categoryFetched) const RefineProgress('Fetching more options to fine-tune your prompt. Hang tight!'),
          ],
        ),
      ),
    );
  }
}
