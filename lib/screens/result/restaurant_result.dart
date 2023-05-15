import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/result/restaurant_card.dart';
import 'package:prometh_ai/state/factor.dart';
import 'package:prometh_ai/state/restaurant.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';

class RestaurantResult extends HookConsumerWidget {
  const RestaurantResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factors = ref.watch(factorNotifier);
    final response = ref.watch(restaurantAPI(factors));

    return response.map(
      data: (data) => GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: response.value!.restaurants.mapp((r) => RestaurantCard(restaurant: r))),
      error: (error) => const Center(child: NormalBody("No restaurant found, try to refine your factors!")),
      loading: (_) => const Center(child: Progress()),
    );
  }
}
