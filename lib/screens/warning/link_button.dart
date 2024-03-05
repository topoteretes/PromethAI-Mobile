import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends HookConsumerWidget {
  final String title;
  final String link;

  const LinkButton(this.title, {super.key, required this.link});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    openUrl() async => !await launchUrl(Uri.parse(link));
    return InkWell(
      onTap: openUrl,
      child: Text(title, style: tt(context).titleMedium!.copyWith(color: C.white, decoration: TextDecoration.underline, height: 1.5)),
    );
  }
}
