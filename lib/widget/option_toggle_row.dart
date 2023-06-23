import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class OptionToggleRow extends HookConsumerWidget {
  final bool selected;
  final String title;
  final VoidCallback onToggle;

  const OptionToggleRow({
    super.key,
    required this.selected,
    required this.title,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: C.white,
          border: Border.all(color: C.front),
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                title,
                softWrap: true,
                maxLines: 3,
                style: tt(context).titleMedium!.copyWith(color: C.front),
              ),
            ),
            Switch(
              value: selected,
              activeColor: Colors.red,
              onChanged: (_) => onToggle(),
            )
          ],
        ),
      );
}
