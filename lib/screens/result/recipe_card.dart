import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/pexel_params.dart';
import 'package:prometh_ai/model/recipe.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/pexel.dart';
import 'package:prometh_ai/state/selected_recipe.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/rating.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RecipeCard extends HookConsumerWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(getPhotoAPI(PexelParams(query: recipe.title, size: "small")));
    final path = ref.watch(PathNotifier.provider);
    final selectedRecipeNotifier = ref.read(SelectedRecipeNotifier.provider.notifier);
    final breadCrumb = [
      _PathText("${recipe.prepTime} min", left: false),
      ...path.mapp((p) => _PathText(p)),
    ];

    return Container(
      margin: const EdgeInsets.only(left: M.normal, right: M.normal),
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
                  Row(
                    children: [
                      _BodyText((recipe.rating / 20).toStringAsFixed(1)),
                      const SizedBox(width: M.small),
                      Rating(rating: recipe.rating),
                      const Spacer(),
                      const _BodyText("(212 reviews)"),
                    ],
                  ),
                  const SizedBox(height: M.normal),
                  SizedBox(
                    width: double.infinity,
                    height: 24,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: breadCrumb.length,
                      itemBuilder: (context, index) => breadCrumb[index],
                      separatorBuilder: (context, index) => VerticalDivider(color: C.front.withAlpha(128)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: M.normal, right: M.normal),
              child: AButton(title: "Cook now", onPressed: () => selectedRecipeNotifier.store(recipe))),
          const SizedBox(height: M.normal),
        ],
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String title;

  const _BodyText(this.title);

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).displayLarge!.copyWith(fontSize: 16, height: 19 / 16),
        textAlign: TextAlign.left,
      );
}

class _PathText extends StatelessWidget {
  final bool left;
  final String title;

  const _PathText(
    this.title, {
    this.left = true,
  });

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: tt(context).displayLarge!.copyWith(fontSize: 16, height: 19 / 16, color: C.grey),
        textAlign: TextAlign.left,
      );
}
