import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/input_text.dart';
import 'package:prometh_ai/widget/svg_button.dart';

class PromptBox extends HookConsumerWidget {
  final String title;
  final bool restart;

  const PromptBox({required this.title, this.restart = false, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
        height: 51,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: M.normal),
            Expanded(
                child: InputText(
                    onChanged: (_) {},
                    backgroundColor: C.grey2,
                    placeholder: "Ask something",
                    borderColor: C.grey2,
                    suffixIcon: SVGButton(
                      onPressed: () {},
                      icon: 'assets/svgs/mic.svg.vec',
                      color: C.grey,
                      iconSize: 17,
                      size: 32,
                    ))),
            if (restart) const SizedBox(width: M.normal),
            if (restart)
              SVGButton(
                onPressed: () {},
                icon: 'assets/svgs/reload.svg.vec',
                color: C.grey,
                iconSize: 24,
                size: 32,
              )
          ],
        ),
      );
}
