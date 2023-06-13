import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'recipe_option.dart';

class RecipeDetailPage extends HookConsumerWidget {
  final List<String> options;
  final bool renderCheckbox;

  const RecipeDetailPage({super.key, required this.options, required this.renderCheckbox});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState<List<String>>([]);

    final toggleSelected = useCallback((String option) {
      if (selected.value.contains(option)) {
        selected.value = [...selected.value]..remove(option);
      } else {
        selected.value = [...selected.value, option];
      }
    }, [selected.value]);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: options.mapp((o) => RecipeOption(
                title: o,
                renderCheckbox: renderCheckbox,
                selected: selected.value.contains(o),
                onPressed: () => toggleSelected(o),
              )),
        ),
      ),
    ));
  }
}
