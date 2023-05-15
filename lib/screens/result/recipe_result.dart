import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/recipe_api.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/state/factor.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';

import 'recipe_card.dart';

class RecipeResult extends HookConsumerWidget {
  const RecipeResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factors = ref.watch(factorNotifier);
    final response = ref.watch(recipeAPI(factors));

    return response.map(
      data: (data) => GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: response.value!.recipes.mapp((r) => RecipeCard(recipe: r))),
      error: (error) => Center(child: NormalBody(error.toString())),
      loading: (_) => const Center(child: Progress()),
    );
  }
}
