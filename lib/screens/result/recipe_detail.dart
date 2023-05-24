import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/pexel_params.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/pexel.dart';
import 'package:prometh_ai/state/selected_recipe.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/base_screen.dart';
import 'package:prometh_ai/widget/bullet_item.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';
import 'package:prometh_ai/widget/texts/screen_title.dart';
import 'package:prometh_ai/widget/texts/subtitle.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:vector_graphics/vector_graphics.dart';

class RecipeDetailScreen extends HookConsumerWidget {
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final selectedRecipe = ref.watch(SelectedRecipeNotifier.provider)!;
    final imageUrl = ref.watch(getPhotoAPI(PexelParams(query: selectedRecipe.title, size: "large")));

    return BaseScreen(
      child: Padding(
        padding: const EdgeInsets.only(left: M.normal, right: M.normal),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(alignment: Alignment.center, height: 48, child: ScreenTitle(selectedRecipe.title)),
                  const SizedBox(height: M.small),
                  SizedBox(
                    height: 256,
                    child: imageUrl.value == null
                        ? const ExCentProgress()
                        : ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8),
                            ),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl.value!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              filterQuality: FilterQuality.high,
                            ),
                          ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const SvgPicture(AssetBytesLoader('assets/svgs/hammer.svg.vec')),
                      const SizedBox(width: 4),
                      Text("${selectedRecipe.prepTime} min", style: tt(context).bodySmall),
                      const SizedBox(width: 8),
                      const SvgPicture(AssetBytesLoader('assets/svgs/flame.svg.vec')),
                      const SizedBox(width: 4),
                      Text("${selectedRecipe.prepTime} min", style: tt(context).bodySmall),
                    ],
                  ),
                  const SizedBox(height: 8),
                  NormalTitle(selectedRecipe.description),
                  const SizedBox(height: 16),
                  const Subtitle("Ingredients"),
                  ...selectedRecipe.ingredients.mapp((i) => BulletItem(title: i)),
                  const SizedBox(height: 16),
                  const Subtitle("Instructions"),
                  ...selectedRecipe.instructions.mapp((i) => BulletItem(title: i)),
                ],
              ),
            ),
            AButton(title: "Done", onPressed: appStateNotifier.result),
          ],
        ),
      ),
    );
  }
}
