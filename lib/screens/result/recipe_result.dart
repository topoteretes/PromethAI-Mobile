import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/recipe_api.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/factor.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'recipe_card.dart';

class RecipeResult extends HookConsumerWidget {
  const RecipeResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factors = ref.watch(factorNotifier);
    final response = ref.watch(recipeAPI(factors));
    final recipes = response.value?.recipes ?? [];
    final index = useState(0);

    return Column(
      children: [
        response.map(
          data: (data) => Expanded(
            child: PageView(
              onPageChanged: (page) => index.value = page,
              children: recipes.mapp((r) => RecipeCard(recipe: r)),
            ),
          ),
          error: (error) => Center(child: NormalBody(error.toString())),
          loading: (_) => const ExCentProgress(inverted: true),
        ),
        const SizedBox(height: M.normal),
        if (recipes.isNotEmpty)
          AnimatedSmoothIndicator(
            activeIndex: index.value,
            count: recipes.length,
            effect: const WormEffect(
                spacing: M.small,
                radius: R.big,
                dotWidth: R.big,
                dotHeight: R.big,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: C.back,
                activeDotColor: C.grey3),
          ),
      ],
    );
  }
}
