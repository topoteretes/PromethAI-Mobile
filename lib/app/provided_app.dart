import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/app/auth_app.dart';
import 'package:prometh_ai/app/base_app.dart';
import 'package:prometh_ai/screens/welcome_screen.dart';
import 'package:prometh_ai/state/skip_auth.dart';
import 'package:prometh_ai/state/startup.dart';
import 'package:prometh_ai/utils/page_creator.dart';

class ProviderApp extends HookConsumerWidget {
  const ProviderApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skipAuth = ref.watch(SkipAuthNotifier.provider);
    final startup = ref.watch(StartupNotifier.provider);

    return MaterialApp(
      home: Navigator(
        onPopPage: (route, result) => false,
        pages: [
          pageCreator(const WelcomeScreen()),
          if (skipAuth) pageCreator(const BaseApp(auth: false)),
          if (!skipAuth && startup != Startup.welcome) pageCreator(AuthApp(startup: startup)),
        ],
      ),
    );
  }
}
