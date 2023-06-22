import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';

import 'theme_selectors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final Widget? rightIcon;

  const RoundButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        child: Container(
          height: 48,
          padding: const EdgeInsets.only(left: 24, right: 24),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            color: C.front,
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                offset: Offset(0, -2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title,
                  style: tt(context).titleMedium!.copyWith(color: C.white),
                ),
              ),
              if (rightIcon != null) rightIcon!,
            ],
          ),
        ),
      );
}
