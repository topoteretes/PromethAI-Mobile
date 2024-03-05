import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/thumbnail_api.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/utils/logger.dart';
import 'package:prometh_ai/widget/progress.dart';

class RecipePlaceholder extends HookConsumerWidget {
  const RecipePlaceholder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => const SizedBox(
        width: double.infinity,
        child: Image(image: AssetImage('assets/images/recipe_placeholder.jpg'), fit: BoxFit.cover),
      );
}

class ReplicateImage extends HookConsumerWidget {
  final String? recipeTitle;

  const ReplicateImage({super.key, required this.recipeTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptUpdating = ref.watch(PromptNotifier.provider.select((p) => p.updating));
    if (recipeTitle == null || promptUpdating) {
      return const Center(child: Progress());
    }
    final imageUrl = ref.watch(thumbnailAPI(recipeTitle!));

    return imageUrl.map(
        data: (data) => CachedNetworkImage(
              imageUrl: imageUrl.value!,
              fit: BoxFit.cover,
              width: double.infinity,
              filterQuality: FilterQuality.high,
            ),
        error: (error) {
          L.e("thumbnail.error: $error");
          return const RecipePlaceholder();
        },
        loading: (_) => const Center(child: Progress()));
  }
}
