import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/screens/start/scope_content.dart';
import 'package:prometh_ai/screens/start/start_content.dart';
import 'package:prometh_ai/screens/start/main_menu.dart';
import 'package:prometh_ai/state/scope.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/cross_fade.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scopeVisible = ref.watch(ScopeNotifier.provider);
    return Scaffold(
      backgroundColor: C.back,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MainMenu(),
            Expanded(
              child: CrossFade(
                isFirstVisible: !scopeVisible,
                firstChild: const StartContent(),
                secondChild: const ScopeContent(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
