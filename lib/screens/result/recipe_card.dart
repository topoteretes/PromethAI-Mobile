import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection_ext/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/pexel_params.dart';
import 'package:prometh_ai/model/recipe.dart';
import 'package:prometh_ai/state/pexel.dart';
import 'package:prometh_ai/state/selected_recipe.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/rounded_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:vector_graphics/vector_graphics.dart';

class RecipeCard extends HookConsumerWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(getPhotoAPI(PexelParams(query: recipe.title, size: "small")));
    final selectedRecipeNotifier = ref.read(SelectedRecipeNotifier.provider.notifier);

    return InkWell(
      onTap: () => selectedRecipeNotifier.store(recipe),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8),
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
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ...1.upTo(5).map((e) => Icon(
                              _getStar(recipe.rating / 20)(e),
                              color: C.front,
                              size: 12,
                            )),
                        const Spacer(),
                        const Icon(
                          Icons.euro,
                          color: C.front,
                          size: 12,
                        )
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      recipe.title,
                      style: tt(context).bodySmall,
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SvgPicture(AssetBytesLoader('assets/svgs/favorite.svg.vec')),
                        SizedBox(width: 8),
                        Flexible(child: RoundedButton("Cook now")),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _getStar(double rating) => (int index) => index - rating == 0.5 ? Icons.star_half : (index < rating ? Icons.star : Icons.star_border);
}
