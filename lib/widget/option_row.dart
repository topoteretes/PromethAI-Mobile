import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/compose.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class OptionRow extends HookConsumerWidget {
  final bool selected;
  final bool disabled;
  final bool hasOptions;
  final String title;
  final VoidCallback? onSelect;
  final VoidCallback? onDetail;

  const OptionRow({
    super.key,
    this.onSelect,
    this.onDetail,
    this.selected = false,
    this.disabled = false,
    this.hasOptions = false,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(44),
          color: selected ? C.front : C.white,
          border: Border.all(color: disabled ? C.grey3 : C.front),
        ),
        padding: const EdgeInsets.fromLTRB(16, 8, 10, 8),
        margin: const EdgeInsets.only(bottom: 16),
        child: InkWell(
          onTap: onSelect,
          borderRadius: BorderRadius.circular(44),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: tt(context).titleMedium!.copyWith(color: disabled ? C.grey3 : (selected ? C.white : C.front)),
                ),
              ),
              if (disabled)
                Text(
                  "coming soon",
                  style: tt(context).titleMedium!.copyWith(color: C.grey3, fontWeight: FontWeight.w300),
                ),
              if (hasOptions && !disabled && selected)
                CircleButton(
                  onPressed: compose(onSelect, onDetail),
                  icon: "down_arrow",
                  size: 24,
                  iconColor: C.front,
                  iconSize: !selected ? 16 : 8,
                  color: C.white,
                ),
              if (!disabled && !selected)
                CircleButton(
                  icon: "close",
                  size: 24,
                  iconColor: C.front,
                  iconSize: !selected ? 16 : 8,
                  color: C.white,
                )
            ],
          ),
        ),
      );
}
