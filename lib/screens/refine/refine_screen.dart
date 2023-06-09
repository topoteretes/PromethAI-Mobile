import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/refine/refine_body.dart';
import 'package:prometh_ai/screens/refine/refine_progress.dart';
import 'package:prometh_ai/state/tree.dart';

import 'refine_bottom.dart';
import 'refine_top.dart';

class RefineScreen extends HookConsumerWidget {
  const RefineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tree = ref.watch(TreeNotifier.provider);
    final showProgress = tree.isEmpty;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RefineTop(),
          if (showProgress) const RefineProgress('Identifying decision points in your prompt. Just a couple of seconds!'),
          if (!showProgress) const RefineBody(),
          if (!showProgress) const RefineBottom()
        ],
      ),
    );
  }
}
