import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/widget/option_row.dart';

class OneSubTree extends HookConsumerWidget {
  final Tree tree;

  const OneSubTree({super.key, required this.tree});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pathNotifier = ref.read(PathNotifier.provider.notifier);
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);

    final nodes = tree.options;

    return ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        children: nodes.mapp(
          (n) => OptionRow(
            title: n.category,
            selected: tree.preference.contains(n.category),
            hasOptions: n.options.isNotEmpty,
            onSelect: () => promptNotifier.updatePreference(tree, n.category),
            onDetail: () => pathNotifier.add(n.category),
          ),
        ));
  }
}
