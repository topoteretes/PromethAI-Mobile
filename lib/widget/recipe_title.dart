import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/last_recipe.dart';
import 'package:prometh_ai/theme.dart';

import '../state/prompt.dart';
import 'theme_selectors.dart';

class RecipeTitle extends HookConsumerWidget {
  final String prompt;

  const RecipeTitle({super.key, required this.prompt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptUpdating = ref.watch(PromptNotifier.provider.select((p) => p.updating));

    final recipeTitle = ref.watch(LastRecipeNotifier.provider);

    if (recipeTitle == null || promptUpdating) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: C.grey7.withOpacity(0.8),
            offset: const Offset(0, 0),
            blurRadius: 32,
          ),
        ],
      ),
      child: Text(
        recipeTitle,
        style: tt(context).bodyLarge!.copyWith(
              color: C.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        maxLines: 10,
      ),
    );
  }
}
