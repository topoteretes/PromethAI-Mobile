import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/refine/refine_body.dart';
import 'package:prometh_ai/screens/refine/refine_progress.dart';
import 'package:prometh_ai/state/prompt.dart';

import 'refine_bottom.dart';
import 'refine_top.dart';

class RefineScreen extends HookConsumerWidget {
  const RefineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(PromptNotifier.provider);
    final showProgress = prompt.tree.isEmpty;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RefineTop(),
          if (showProgress) const RefineProgress(),
          if (!showProgress) const RefineBody(),
          /*       if (!showProgress)
            const Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: PromptBox(title: "Anything you'd like to add"),
            ),*/
          if (!showProgress) const RefineBottom()
        ],
      ),
    );
  }
}
