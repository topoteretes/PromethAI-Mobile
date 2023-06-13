import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/pexel_params.dart';
import 'package:prometh_ai/model/recipe.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/pexel.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RecipeCompactCard extends HookConsumerWidget {
  final Recipe recipe;

  const RecipeCompactCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(getPhotoAPI(PexelParams(query: recipe.title, size: "small")));
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(R.big)),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8, spreadRadius: 0, offset: Offset(0, 2))],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 162,
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  recipe.title,
                  style: tt(context).titleMedium!.copyWith(fontWeight: FontWeight.w500, color: C.black),
                  textAlign: TextAlign.left,
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: appStateNotifier.scheduleLater,
                    icon: const Icon(
                      Icons.keyboard_arrow_right,
                      color: C.front,
                      size: 32,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
