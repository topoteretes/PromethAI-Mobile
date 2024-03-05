import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/recipe.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/history.dart';
import 'package:prometh_ai/state/selected_recipe.dart';
import 'package:prometh_ai/state/warning.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/circle_icon_button.dart';
import 'package:prometh_ai/widget/confirm_dialog.dart';
import 'package:prometh_ai/widget/replicate_image.dart';
import 'package:prometh_ai/widget/round_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

class RecipeCard extends HookConsumerWidget {
  final Recipe recipe;
  final bool fromHistory;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.fromHistory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRecipeNotifier = ref.read(SelectedRecipeNotifier.provider.notifier);
    final historyNotifier = ref.read(HistoryNotifier.provider.notifier);
    final isFavorite =
        ref.watch(HistoryNotifier.provider.select((e) => e.firstWhereOrNull((f) => f.recipe.title == recipe.title)?.favorite ?? false));
    final warningNotifier = ref.read(WarningNotifier.provider.notifier);
    return Container(
      margin: const EdgeInsets.only(left: M.normal, right: M.normal, bottom: M.small),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(R.big)),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8, spreadRadius: 0, offset: Offset(0, 2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 3,
              child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: ReplicateImage(recipeTitle: recipe.title))),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(M.normal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    recipe.title,
                    style: tt(context).displayLarge,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: M.normal),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        recipe.description,
                        style: tt(context).bodySmall!.copyWith(color: C.black),
                        textAlign: TextAlign.left,
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(height: M.normal),
                  SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        fromHistory
                            ? CircleButton(
                                icon: "close",
                                size: 48,
                                color: C.front,
                                iconColor: C.front,
                                borderOnly: true,
                                onPressed: () => confirmDialog(context, onSure: () => historyNotifier.remove(recipe)),
                              )
                            : CircleIconButton(
                                icon: Icons.warning_amber_outlined,
                                size: 44,
                                iconSize: 44,
                                color: C.white,
                                iconColor: C.front,
                                onPressed: warningNotifier.show),
                        RoundButton(
                            onPressed: () => selectedRecipeNotifier.store(recipe, fromHistory),
                            title: "Cook now",
                            rightIcon: Container(
                              width: 24,
                              height: 24,
                              margin: const EdgeInsets.only(left: 12),
                              decoration: const BoxDecoration(shape: BoxShape.circle, color: C.white),
                              child: const VecPic(
                                "up_arrow",
                                color: C.front,
                                iconSize: 8,
                              ),
                            )),
                        CircleButton(
                            icon: "favorite",
                            size: 48,
                            iconSize: 24,
                            color: C.front,
                            iconColor: isFavorite ? C.front : C.white,
                            borderOnly: isFavorite,
                            onPressed: () => historyNotifier.toggleFavorite(recipe)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
