import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class RecipeOption extends HookConsumerWidget {
  final String title;
  final VoidCallback onPressed;
  final bool selected;
  final bool renderCheckbox;

  const RecipeOption({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
    required this.renderCheckbox,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => InkWell(
        onTap: onPressed,
        child: Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: tt(context).titleMedium!.copyWith(color: C.black),
                  ),
                ),
                if (renderCheckbox) const SizedBox(width: 16),
                if (renderCheckbox)
                  Icon(
                    selected ? Icons.check_circle : Icons.circle_outlined,
                    size: 24,
                  )
              ],
            )),
      );
}
