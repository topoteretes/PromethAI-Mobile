import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/recipe/recipe_detail_page.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/selected_recipe.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aclose_button.dart';
import 'package:prometh_ai/widget/bottom_view.dart';
import 'package:prometh_ai/widget/round_button.dart';
import 'package:prometh_ai/widget/slide_switcher.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RecipeDetailScreen extends HookConsumerWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRecipe = ref.watch(SelectedRecipeNotifier.provider);
    final appStateNotifier = ref.watch(AppStateNotifier.provider.notifier);
    final controller = usePageController();

    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(selectedRecipe.title, style: tt(context).bodyLarge!.copyWith(color: C.front)),
                ACloseButton(onPressed: appStateNotifier.result, color: C.front),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: SlideSwitcher(
                options: const [SlideSwitcherOption("Ingredients", 0), SlideSwitcherOption("Method", 1)],
                onChange: (page) {
                  if (controller.hasClients) {
                    controller.animateToPage(page, duration: A.normal, curve: CV.normal);
                  }
                }),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                RecipeDetailPage(options: selectedRecipe.ingredients, renderCheckbox: true),
                RecipeDetailPage(options: selectedRecipe.instructions, renderCheckbox: false),
              ],
            ),
          ),
          BottomView(
            child: RoundButton(
              title: "Schedule for later",
              onPressed: appStateNotifier.scheduleLater,
            ),
          ),
        ],
      ),
    ));
  }
}
