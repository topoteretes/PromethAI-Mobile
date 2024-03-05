import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/recipe_api.dart';
import 'package:prometh_ai/screens/recipe/result_top.dart';
import 'package:prometh_ai/screens/recipe_carousel.dart';
import 'package:prometh_ai/state/last_recipe.dart';
import 'package:prometh_ai/theme.dart';

class RecipeResultScreen extends HookConsumerWidget {
  const RecipeResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastRecipe = ref.watch(LastRecipeNotifier.provider);
    final response = ref.watch(recipeAPI(lastRecipe!));
    final recipes = response.value?.recipes ?? [];
    return Scaffold(
      backgroundColor: C.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            const ResultTop(),
            Flexible(
              child: RecipeCarousel(
                recipes: recipes,
                fromHistory: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
