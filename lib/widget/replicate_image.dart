import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/replicate_api.dart';
import 'package:prometh_ai/settings.dart';
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
  final String prompt;

  const ReplicateImage({super.key, required this.prompt});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(replicateAPI(prompt));

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(R.big),
        topLeft: Radius.circular(R.big),
      ),
      child: imageUrl.map(
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
          loading: (_) => const Center(child: Progress())),
    );
  }
}
