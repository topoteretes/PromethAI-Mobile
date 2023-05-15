import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/result/delivery_card.dart';
import 'package:prometh_ai/api/delivery_api.dart';
import 'package:prometh_ai/state/factor.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';
import 'package:url_launcher/url_launcher.dart';

class DeliveryResult extends HookConsumerWidget {
  const DeliveryResult({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factors = ref.watch(factorNotifier);
    final response = ref.watch(deliveryAPI(factors));

    return response.map(
      data: (data) => InkWell(
        onTap: () => launchUrl(Uri.parse(data.value.url)),
        child: DeliveryCard(response: data.value, size: "large"),
      ),
      error: (error) => const Center(child: NormalBody("No delivery found, try to refine your factors!")),
      loading: (_) => const Center(child: Progress()),
    );
  }
}
