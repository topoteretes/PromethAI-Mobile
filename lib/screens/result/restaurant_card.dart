import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/pexel_params.dart';
import 'package:prometh_ai/model/restaurant.dart';
import 'package:prometh_ai/state/pexel.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RestaurantCard extends HookConsumerWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(getPhotoAPI(PexelParams(query: restaurant.name, size: "small")));
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8, spreadRadius: 0, offset: Offset(0, 2))],
      ),
      child: Stack(
        children: [
          imageUrl.value == null
              ? const Center(child: Progress())
              : ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl.value!,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.high,
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                restaurant.name,
                style: tt(context).titleLarge!.copyWith(color: C.back, shadows: [
                  const Shadow(
                    offset: Offset(0.0, 0.0),
                    blurRadius: 5.0,
                    color: C.front,
                  ),
                ]),
                softWrap: true,
                maxLines: 5,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
