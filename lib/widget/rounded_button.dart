import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'theme_selectors.dart';

class RoundedButton extends HookConsumerWidget {
  final String title;

  const RoundedButton(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/rounded_btn_bg.png",
          height: 32,
          centerSlice: const Rect.fromLTRB(12, 0, 12, 0),
        ),
        Center(child: Text(title, style: tt(context).bodySmall!.copyWith(color: Colors.white, height: 25 / 12)))
      ],
    );
  }
}
