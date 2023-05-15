import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aicon_button.dart';
import 'package:prometh_ai/widget/texts/normal_body.dart';

class PromptBox extends HookConsumerWidget {
  final String title;
  final bool restart;

  const PromptBox({required this.title, this.restart = false, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => SizedBox(
        height: 51,
        child: Row(
          children: [
            if (restart) AIconButton(onPressed: () {}, icon: Icons.refresh),
            if (restart) const SizedBox(width: M.normal),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(M.normal),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: C.grey),
                  borderRadius: const BorderRadius.all(Radius.circular(R.normal)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NormalBody(title, color: C.grey2),
                    const Spacer(),
                    AIconButton(onPressed: () {}, icon: Icons.mic),
                    const SizedBox(width: M.small),
                    AIconButton(onPressed: () {}, icon: Icons.camera_alt),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
}
