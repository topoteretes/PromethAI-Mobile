import 'package:flutter/material.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

import 'texts/display_small.dart';

class PillButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const PillButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isDisabled ? C.grey2 : C.front;
    return Theme(
      data: t(context).copyWith(
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(R.xxx)),
              ),
              side: BorderSide(color: color, width: 2),
              backgroundColor: color),
        ),
      ),
      child: OutlinedButton(
        onPressed: onPressed,
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DisplaySmall(
                title,
                inverted: isDisabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
