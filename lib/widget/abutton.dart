import 'package:flutter/material.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

import 'texts/normal_body.dart';

class AButton extends StatelessWidget {
  final bool inverted;
  final String title;
  final VoidCallback onPressed;

  const AButton({
    super.key,
    this.inverted = false,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Theme(
        data: t(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(R.normal)),
                ),
                side: BorderSide(color: inverted ? C.back : C.front, width: 2),
                backgroundColor: inverted ? C.back : C.front),
          ),
        ),
        child: OutlinedButton(
          onPressed: onPressed,
          child: SizedBox(
            width: double.infinity,
            height: 65,
            child: Center(
              child: NormalBody(
                title,
                inverted: !inverted,
              ),
            ),
          ),
        ),
      );
}
