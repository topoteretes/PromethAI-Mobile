import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/widget/option_row.dart';

import 'cascading_wrapper.dart';

class OneSubTree extends HookConsumerWidget {
  final Tree tree;
  final List<String> path;

  const OneSubTree({super.key, required this.tree, required this.path});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathNotifier = ref.read(PathNotifier.provider.notifier);
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);

    final nodes = tree.options;

    final optionRows = nodes.mapp(
      (n) {
        final isSelected = tree.preference.contains(n.category);
        final renderSubSelects = path.isEmpty && isSelected && n.preference.isNotEmpty;
        return CascadingWrapper(
          path: path,
          child: OptionRow(
            title: renderSubSelects ? n.preference.join(", ") : n.category,
            selected: isSelected,
            hasOptions: n.options.isNotEmpty,
            onSelect: () => treeNotifier.togglePreference(tree, n.category),
            onDetail: () => pathNotifier.add(n.category),
            noMargin: true,
          ),
        );
      },
    );
    return ListView(padding: const EdgeInsets.fromLTRB(16, 24, 16, 16), children: [
      if (path.isNotEmpty)
        OptionRow(title: "⇪", selected: true, hasOptions: false, onSelect: pathNotifier.back, noMargin: false, centered: true),
      ...optionRows
    ]);
  }
}
