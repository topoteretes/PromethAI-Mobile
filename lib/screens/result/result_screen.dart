import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/result/delivery_result.dart';
import 'package:prometh_ai/screens/result/restaurant_result.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/base_screen.dart';
import 'package:prometh_ai/widget/texts/display_small.dart';

import '../../widget/texts/normal_title.dart';
import 'recipe_result.dart';

enum ResultType { delivery, recipes, restaurant }

class ResultScreen extends HookConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final selectedSegment = useState(ResultType.delivery);
    final pageController = usePageController(initialPage: 0);

    useEffect(() {
      if (pageController.hasClients) {
        pageController.animateToPage(selectedSegment.value.index, duration: A.normal, curve: Curves.easeInOut);
      }
      return null;
    }, [selectedSegment.value]);
    return BaseScreen(
        color: C.grey5,
        bottomPadding: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 38),
            const NormalTitle("Results"),
            const SizedBox(height: M.large),
            SegmentedButton(
              showSelectedIcon: false,
              style: ButtonStyle(
                padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((state) => const EdgeInsets.all(M.large)),
                side: MaterialStateProperty.resolveWith<BorderSide>((state) => const BorderSide(color: C.front, width: 1)),
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.selected)) {
                      return C.back;
                    }
                    return C.grey5;
                  },
                ),
              ),
              segments: const [
                ButtonSegment(value: ResultType.delivery, label: DisplaySmall('Delivery')),
                ButtonSegment(value: ResultType.recipes, label: DisplaySmall('Recipes')),
                ButtonSegment(value: ResultType.restaurant, label: DisplaySmall('Restaurant')),
              ],
              selected: {selectedSegment.value},
              onSelectionChanged: (selected) => selectedSegment.value = selected.first,
            ),
            const SizedBox(height: M.normal),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(M.small),
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    DeliveryResult(),
                    RecipeResult(),
                    RestaurantResult(),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: appStateNotifier.goal,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(bottom: M.large + M.normal, top: M.large),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 1, color: C.grey4),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(R.huge),
                          topRight: Radius.circular(R.huge),
                        ),
                      ),
                      child: const NormalTitle("Refine")),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
