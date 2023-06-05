import 'package:flutter/widgets.dart';
import 'package:prometh_ai/widget/round_card.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) => RoundCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Vasilije,',
              style: tt(context).bodyLarge,
            ),
            const SizedBox(height: 15),
            Container(
              constraints: const BoxConstraints(
                maxWidth: 310,
              ),
              child: Text(
                'As your AI assistant, l’m here to help you find the meal you crave. \nTo get started, simply describe what you have in mind and we’ll take it from there.',
                style: tt(context).bodySmall,
              ),
            ),
          ],
        ),
      );
}
