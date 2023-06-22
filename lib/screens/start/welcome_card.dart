import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/user_name.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class WelcomeCard extends HookConsumerWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(UserNameNotifier.provider);
    return RoundCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello ${userName == null || userName.isEmpty ? "Friend" : userName},',
            style: tt(context).bodyLarge,
          ),
          const SizedBox(height: 15),
          Text(
            'As your AI assistant, l’m here to help you find the meal you crave. \nTo get started, simply describe what you have in mind and we’ll take it from there.',
            style: tt(context).bodySmall,
          ),
        ],
      ),
    );
  }
}
