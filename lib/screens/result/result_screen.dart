import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/result/delivery_result.dart';
import 'package:prometh_ai/screens/result/restaurant_result.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/base_screen.dart';
import 'package:prometh_ai/widget/texts/screen_title.dart';

import 'recipe_result.dart';

enum ResultType { delivery, recipes, restaurant }

Widget getResultContent(String type) {
  if (type == TreeRoot.order) {
    return const DeliveryResult();
  }

  if (type == TreeRoot.cook) {
    return const RecipeResult();
  }

  return const RestaurantResult();
}

String getTitle(String type) {
  if (type == TreeRoot.order) {
    return "Your deliveries";
  }

  if (type == TreeRoot.cook) {
    return "Your meals";
  }

  return "Your restaurants";
}

class ResultScreen extends HookConsumerWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final path = ref.watch(PathNotifier.provider);
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
      color: C.front,
      child: Column(
        children: [
          Container(
              alignment: Alignment.center,
              height: 48,
              child: ScreenTitle(
                getTitle(path.first),
                inverted: true,
              )),
          const SizedBox(height: M.small),
          Expanded(
            child: getResultContent(path.first),
          ),
          const SizedBox(height: 73),
          Padding(
            padding: const EdgeInsets.all(M.normal),
            child: AButton(
              onPressed: appStateNotifier.goal,
              title: 'Change Preferences',
              outline: true,
            ),
          ),
        ],
      ),
    );
  }
}
