import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';

import 'theme_selectors.dart';

const _separator = "#:#";

String _normalize(String e) => e.toLowerCase().replaceAll(",", "").replaceAll(".", "").replaceAll(";", "").replaceAll(" ", _separator);

String _mark(String prompt, Iterable<String> normalizedEmphasized) {
  var result = prompt;
  for (var s in normalizedEmphasized) {
    if (result.contains(s)) {
      result = result.replaceAll(s, s.replaceAll(" ", _separator));
    }
  }
  return result;
}

String _denormalize(String e) => e.replaceAll(_separator, " ");

class MarkupPrompt extends StatelessWidget {
  final String prompt;
  final List<String> emphasized;
  const MarkupPrompt({super.key, required this.prompt, required this.emphasized});

  @override
  Widget build(BuildContext context) {
    final normalizedEmphasized = emphasized.map(_normalize);
    final children = _mark(prompt, emphasized)
        .split(" ")
        .expand((e) => [
              normalizedEmphasized.contains(_normalize(e))
                  ? TextSpan(text: _denormalize(e), style: tt(context).bodySmall!.copyWith(backgroundColor: C.front.withAlpha(128)))
                  : TextSpan(text: e),
              const TextSpan(text: " ")
            ])
        .toList(growable: false);
    return RichText(
      text: TextSpan(text: "", style: tt(context).bodySmall, children: children),
      maxLines: 5,
    );
  }
}
