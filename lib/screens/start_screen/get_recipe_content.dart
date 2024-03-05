import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/last_recipe.dart';
import 'package:prometh_ai/state/meal_wiz_onboarding_seen.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/widget/asmall_button.dart';
import 'package:prometh_ai/widget/texts/large_body.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

class GetRecipeContent extends HookConsumerWidget {
  const GetRecipeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealWizOnboardingSeenNotifier = ref.read(MealWizOnboardingSeenNotifier.provider.notifier);
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final lastRecipeNotifier = ref.read(LastRecipeNotifier.provider.notifier);

    return Column(
      children: [
        Flexible(
          flex: 1,
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              const SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  child: Image(image: AssetImage('assets/images/onboarding_1.png'), fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: 120,
                    child: ASmallButton(
                      title: "Try Example",
                      onPressed: () {
                        promptNotifier.reset(S.examplePrompt);
                        appStateNotifier.prefetchTree(prompt: S.examplePrompt);
                        appStateNotifier.refine();
                        lastRecipeNotifier.refresh(S.examplePrompt);
                        mealWizOnboardingSeenNotifier.seen();
                      },
                    )),
              )
            ],
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const NormalTitle("MealWiz"),
              const SizedBox(height: 16),
              const Padding(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: LargeBody("Your Personal Food Guru"),
              ),
              const SizedBox(height: 32),
              SizedBox(
                  width: 252,
                  child: ASmallButton(
                    title: "Start - It's free",
                    inverted: true,
                    outline: true,
                    onPressed: mealWizOnboardingSeenNotifier.seen,
                  )),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
