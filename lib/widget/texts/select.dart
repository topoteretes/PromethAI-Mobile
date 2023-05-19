import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/slide_switcher.dart';

class Select extends HookConsumerWidget {
  final bool selected;
  final void Function(bool) onChange;

  const Select({
    super.key,
    required this.selected,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => InkWell(
        borderRadius: BorderRadius.circular(300.0),
        onTap: () => onChange(!selected),
        child: Container(
          width: 33,
          height: 33,
          decoration: BoxDecoration(
            color: selected ? C.front : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: selected ? C.front : C.grey4),
          ),
          child: const Icon(
            Icons.check,
            color: C.back,
          ),
        ),
      );
}
