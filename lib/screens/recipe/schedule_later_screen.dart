import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/recipe/recipe_compact_card.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/selected_recipe.dart';
import 'package:prometh_ai/state/warning.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aclose_button.dart';
import 'package:prometh_ai/widget/bottom_view.dart';
import 'package:prometh_ai/widget/circle_icon_button.dart';
import 'package:prometh_ai/widget/option_row.dart';
import 'package:prometh_ai/widget/round_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/top_view.dart';

class ScheduleLaterScreen extends HookConsumerWidget {
  const ScheduleLaterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedRecipe = ref.watch(SelectedRecipeNotifier.provider);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final warningNotifier = ref.read(WarningNotifier.provider.notifier);

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Schedule for later", style: tt(context).bodyLarge!.copyWith(color: C.black)),
                  ACloseButton(onPressed: appStateNotifier.recipeDetail, color: C.black),
                ],
              ),
              const SizedBox(height: 16),
              RecipeCompactCard(recipe: selectedRecipe),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
          child: Text(
            "Actions",
            style: tt(context).labelMedium,
          ),
        ),
        const OptionRow(selected: false, disabled: true, title: "Block meal time in my calendar", padded: true),
        const OptionRow(selected: false, disabled: true, title: "Order missing ingredients", padded: true),
        const OptionRow(selected: false, disabled: true, title: "Add to calorie tracker", padded: true),
        const Spacer(),
        BottomView(
          child: Row(
            children: [
              CircleIconButton(
                  icon: Icons.warning_amber_outlined,
                  size: 44,
                  iconSize: 44,
                  color: C.header,
                  iconColor: C.front,
                  onPressed: warningNotifier.show),
              const SizedBox(width: 16),
              Expanded(
                child: RoundButton(
                    title: "Schedule for later",
                    onPressed: () => Fluttertoast.showToast(
                        msg: "Coming soon",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: C.header,
                        textColor: Colors.white,
                        fontSize: 32.0)),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
