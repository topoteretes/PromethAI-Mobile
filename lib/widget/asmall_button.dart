import 'package:flutter/material.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class ASmallButton extends StatelessWidget {
  final bool inverted;
  final bool outline;
  final bool enabled;
  final String title;
  final VoidCallback onPressed;

  const ASmallButton({
    super.key,
    this.inverted = false,
    this.outline = false,
    this.enabled = true,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Opacity(
        opacity: enabled ? 1 : 0.5,
        child: Theme(
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
            onPressed: enabled ? onPressed : null,
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: Center(
                child: Text(
                  title,
                  style: tt(context).bodyMedium!.copyWith(color: inverted ? C.front : C.white),
                ),
              ),
            ),
          ),
        ),
      );
}
