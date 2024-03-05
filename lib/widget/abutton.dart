import 'package:flutter/material.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/texts/button_title.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class AButton extends StatelessWidget {
  final bool inverted;
  final bool outline;
  final String title;
  final VoidCallback onPressed;

  const AButton({
    super.key,
    this.inverted = false,
    this.outline = false,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Theme(
        data: t(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(R.xxx)),
                ),
                side: BorderSide(color: outline ? C.front : (inverted ? C.white : C.front), width: 2),
                backgroundColor: inverted ? C.white : C.front),
          ),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: 40,
            child: Center(
              child: ButtonTitle(
                title,
                inverted: !inverted,
              ),
            ),
          ),
        ),
      );
}
