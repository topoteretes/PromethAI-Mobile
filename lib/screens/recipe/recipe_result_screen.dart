import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/recipe_api.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/recipe/recipe_top.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'recipe_card.dart';

class RecipeResultScreen extends HookConsumerWidget {
  const RecipeResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(PromptNotifier.provider);
    final response = ref.watch(recipeAPI(prompt));
    final recipes = response.value?.recipes ?? [];
    final index = useState(0);

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const RecipeTop(),
            const SizedBox(height: 24),
            response.map(
              data: (data) => Expanded(
                child: PageView(
                  onPageChanged: (page) => index.value = page,
                  children: recipes.mapp((r) => RecipeCard(recipe: r)),
                ),
              ),
              error: (error) => Center(child: NormalBody(error.toString())),
              loading: (_) => const ExCentProgress(),
            ),
            const SizedBox(height: M.tiny),
            if (recipes.isNotEmpty)
              AnimatedSmoothIndicator(
                activeIndex: index.value,
                count: recipes.length,
                effect: const WormEffect(
                    spacing: M.small,
                    radius: R.normal,
                    dotWidth: R.normal,
                    dotHeight: R.normal,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: C.grey3,
                    activeDotColor: C.front),
              ),
          ],
        ),
      ),
    );
  }
}
