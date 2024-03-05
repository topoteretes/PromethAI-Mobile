import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/refine/refine_body.dart';
import 'package:prometh_ai/screens/old_refine/refine_progress.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/widget/top_menu/top_menu.dart';

class RefineScreen extends HookConsumerWidget {
  const RefineScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tree = ref.watch(TreeNotifier.provider);
    final showProgress = tree.isEmpty;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (tree.isNotEmpty) TopMenu(nodes: tree),
        if (showProgress) const Expanded(child: RefineProgress('Identifying decision points in your prompt.\nJust a couple of seconds!')),
        if (!showProgress) const RefineBody(),
      ],
    );
  }
}
