import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/start_screen/delivery_content.dart';
import 'package:prometh_ai/screens/start_screen/get_recipe_content.dart';
import 'package:prometh_ai/screens/start_screen/restaurants_content.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MealWizOnboarding extends HookConsumerWidget {
  const MealWizOnboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController();

    final pageIndex = useState(0);

    pageListener() => pageIndex.value = (pageController.page ?? 0).round();

    useEffect(() {
      pageController.addListener(pageListener);
      return () => pageController.removeListener(pageListener);
    }, []);

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: C.white,
          child: PageView(
            controller: pageController,
            children: const [
              GetRecipeContent(),
              RestaurantsContent(),
              DeliveryContent(),
            ],
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.5,
          child: Transform.translate(
            offset: const Offset(0, 20),
            child: AnimatedSmoothIndicator(
                activeIndex: pageIndex.value,
                count: 3,
                effect: const WormEffect(
                    spacing: M.small,
                    radius: R.normal,
                    dotWidth: R.normal,
                    dotHeight: R.normal,
                    paintStyle: PaintingStyle.fill,
                    strokeWidth: 1.5,
                    dotColor: C.grey3,
                    activeDotColor: C.front)),
          ),
        ),
      ],
    );
  }
}
