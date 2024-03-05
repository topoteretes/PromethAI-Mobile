import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/refine/refine_screen.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/last_recipe.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/state/warning.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/asmall_button.dart';
import 'package:prometh_ai/widget/bottom_round_card.dart';
import 'package:prometh_ai/widget/circle_icon_button.dart';
import 'package:prometh_ai/widget/prompt_box/prompt_box.dart';
import 'package:prometh_ai/widget/recipe_title.dart';
import 'package:prometh_ai/widget/replicate_image.dart';
import 'package:prometh_ai/widget/texts/italic_title.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final topHeight = height * 282 / 852;
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final prompt = ref.watch(PromptNotifier.provider.select((p) => p.current));
    final warningNotifier = ref.read(WarningNotifier.provider.notifier);
    final appState = ref.watch(AppStateNotifier.provider);
    final lastRecipe = ref.watch(LastRecipeNotifier.provider);

    return Scaffold(
      backgroundColor: C.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              Container(
                color: C.grey7,
                child: BottomRoundCard(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                          color: C.grey5,
                          width: double.infinity,
                          height: topHeight,
                          alignment: Alignment.center,
                          child: (prompt == "")
                              ? const SafeArea(child: ItalicTitle("Your result will be shown here"))
                              : ReplicateImage(recipeTitle: lastRecipe)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: switch (prompt) {
                                "" => CircleIconButton(
                                    icon: Icons.warning_amber_outlined,
                                    size: 44,
                                    iconSize: 44,
                                    color: C.grey5,
                                    iconColor: C.front,
                                    onPressed: warningNotifier.show),
                                _ => RecipeTitle(prompt: prompt),
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16, bottom: 16),
                            child: SizedBox(
                                width: 100,
                                height: 40,
                                child: ASmallButton(
                                  title: "Show all",
                                  enabled: prompt != "",
                                  onPressed: appStateNotifier.recipe,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const PromptBox(title: 'Your request will be shown here'),
            ],
          ),
          if (appState == AppState.refine) const Flexible(child: RefineScreen()),
        ],
      ),
    );
  }
}
