import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/recipe.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'recipe/recipe_card.dart';

class RecipeCarousel extends HookConsumerWidget {
  final bool fromHistory;
  final List<Recipe> recipes;

  const RecipeCarousel({
    super.key,
    required this.recipes,
    required this.fromHistory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = useState(0);

    return Column(
      children: [
        const SizedBox(height: 24),
        recipes.isEmpty
            ? const ExCentProgress()
            : Expanded(
                child: PageView(
                  onPageChanged: (page) => index.value = page,
                  children: recipes.mapp((r) => RecipeCard(
                        recipe: r,
                        fromHistory: fromHistory,
                      )),
                ),
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
    );
  }
}
