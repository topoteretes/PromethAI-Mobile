import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/api/restaurant_api.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/result/restaurant_card.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/factor.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class RestaurantResult extends HookConsumerWidget {
  const RestaurantResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factors = ref.watch(factorNotifier);
    final response = ref.watch(restaurantAPI(factors));
    final restaurants = response.value?.restaurants ?? [];
    final index = useState(0);

    return Column(
      children: [
        response.map(
          data: (data) => Expanded(
              child:
                  PageView(onPageChanged: (page) => index.value = page, children: restaurants.mapp((r) => RestaurantCard(restaurant: r)))),
          error: (error) => const Center(child: NormalBody("No restaurant found, try to refine your factors!")),
          loading: (_) => const Center(child: Progress()),
        ),
        const SizedBox(height: M.normal),
        if (restaurants.isNotEmpty)
          AnimatedSmoothIndicator(
            activeIndex: index.value,
            count: restaurants.length,
            effect: const WormEffect(
                spacing: M.small,
                radius: R.big,
                dotWidth: R.big,
                dotHeight: R.big,
                paintStyle: PaintingStyle.fill,
                strokeWidth: 1.5,
                dotColor: C.back,
                activeDotColor: C.grey3),
          ),
      ],
    );
  }
}
