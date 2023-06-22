import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/recipe_api.dart';
import 'package:prometh_ai/screens/recipe/result_top.dart';
import 'package:prometh_ai/screens/recipe_carousel.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/prompt.dart';

class RecipeResultScreen extends HookConsumerWidget {
  const RecipeResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(PromptNotifier.provider);
    final response = ref.watch(recipeAPI(prompt.current));
    final recipes = response.value?.recipes ?? [];

    return Scaffold(
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
            const SizedBox(height: M.normal)
          ],
        ),
      ),
    );
  }
}
