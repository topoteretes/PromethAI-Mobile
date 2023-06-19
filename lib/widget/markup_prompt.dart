import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/smart_split.dart';

import 'theme_selectors.dart';

class MarkupPrompt extends StatelessWidget {
  final String prompt;
  final String emphasized;
  const MarkupPrompt({super.key, required this.prompt, required this.emphasized});

  @override
  Widget build(BuildContext context) {
    final (normals, separator) = smartSplit(prompt, emphasized);
    final spans = normals.map((e) => "###$e###").join("###$separator###").split("######");
    final children = spans
        .map((e) => e.replaceAll("###", ""))
        .map((e) => e == separator
            ? TextSpan(text: e, style: tt(context).bodySmall!.copyWith(backgroundColor: C.front.withAlpha(128)))
            : TextSpan(text: e))
        .toList(growable: false);
    return RichText(
      text: TextSpan(text: "", style: tt(context).bodySmall, children: children),
      maxLines: 5,
    );
  }
}
