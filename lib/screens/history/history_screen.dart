import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/recipe_carousel.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/history.dart';

class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(HistoryNotifier.provider.select((state) => state.mapp((a) => a.recipe)));

    return Column(
      children: [
        Expanded(
          child: RecipeCarousel(
            recipes: recipes,
            fromHistory: true,
          ),
        ),
        const SizedBox(height: M.normal)
      ],
    );
  }
}
