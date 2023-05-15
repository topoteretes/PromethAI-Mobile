import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/model/delivery_response.dart';
import 'package:prometh_ai/model/pexel_params.dart';
import 'package:prometh_ai/state/pexel.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class DeliveryCard extends HookConsumerWidget {
  final DeliveryResponse response;
  final String size;

  const DeliveryCard({super.key, required this.response, this.size = "small"});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.watch(getPhotoAPI(PexelParams(query: response.url, size: size)));
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.1), blurRadius: 8, spreadRadius: 0, offset: Offset(0, 2))],
      ),
      child: LayoutBuilder(
          builder: (context, constraints) => Stack(
                children: [
                  imageUrl.value == null
                      ? const Center(child: Progress())
                      : ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          child: CachedNetworkImage(
                            imageUrl: imageUrl.value!,
                            fit: BoxFit.cover,
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        response.url,
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
              )),
    );
  }
}
