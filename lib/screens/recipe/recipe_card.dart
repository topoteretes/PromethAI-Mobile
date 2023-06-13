import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/pexel_params.dart';
import 'package:prometh_ai/model/recipe.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/history.dart';
import 'package:prometh_ai/state/pexel.dart';
import 'package:prometh_ai/state/selected_recipe.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/confirm_dialog.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/rating.dart';
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
    final imageUrl = ref.watch(getPhotoAPI(PexelParams(query: recipe.title, size: "small")));
    final selectedRecipeNotifier = ref.read(SelectedRecipeNotifier.provider.notifier);
    final historyNotifier = ref.read(HistoryNotifier.provider.notifier);
    final isFavorite =
        ref.watch(HistoryNotifier.provider.select((e) => e.firstWhereOrNull((f) => f.recipe.title == recipe.title)?.favorite ?? false));

    return Container(
      margin: const EdgeInsets.only(left: M.normal, right: M.normal, bottom: M.normal),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(R.big)),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8, spreadRadius: 0, offset: Offset(0, 2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: imageUrl.value == null
                ? const Center(child: Progress())
                : ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(R.big),
                      topLeft: Radius.circular(R.big),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl.value!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(M.normal),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: M.normal),
                  Text(
                    recipe.title,
                    style: tt(context).displayLarge,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: M.normal),
                  Text(
                    recipe.description,
                    style: tt(context).bodySmall!.copyWith(color: C.black),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: M.normal),
                  Row(
                    children: [
                      Text(
                        (recipe.rating / 20).toStringAsFixed(1),
                        style: tt(context).displayLarge!.copyWith(fontSize: 16, height: 19 / 16),
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: M.small),
                      Rating(rating: recipe.rating / 20),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fromHistory
                          ? CircleButton(
                              icon: "close",
                              size: 64,
                              color: C.front,
                              iconColor: C.front,
                              borderOnly: true,
                              onPressed: () => confirmDialog(context, onSure: () => historyNotifier.remove(recipe)),
                            )
                          : const SizedBox(width: 64),
                      RoundButton(
                          onPressed: () => selectedRecipeNotifier.store(recipe, fromHistory),
                          title: "Cook now",
                          rightIcon: Container(
                            width: 32,
                            height: 32,
                            margin: const EdgeInsets.only(left: 16),
                            decoration: const BoxDecoration(shape: BoxShape.circle, color: C.white),
                            child: const VecPic(
                              "up_arrow",
                              color: C.front,
                              iconSize: 8,
                            ),
                          )),
                      CircleButton(
                          icon: "favorite",
                          size: 64,
                          color: C.front,
                          iconColor: isFavorite ? C.front : C.white,
                          borderOnly: isFavorite,
                          onPressed: () => historyNotifier.toggleFavorite(recipe)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: M.normal),
        ],
      ),
    );
  }
}
