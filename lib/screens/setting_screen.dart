import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/history.dart';
import 'package:prometh_ai/state/session_id.dart';
import 'package:prometh_ai/widget/confirm_dialog.dart';
import 'package:prometh_ai/widget/option_row.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyNotifier = ref.read(HistoryNotifier.provider.notifier);
    final sessionIdNotifier = ref.read(SessionIdNotifier.provider.notifier);
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  OptionRow(
                      selected: false, title: "Clear history", onSelect: () => confirmDialog(context, onSure: historyNotifier.removeAll)),
                  OptionRow(
                      selected: false, title: "Clear session", onSelect: () => confirmDialog(context, onSure: sessionIdNotifier.reset)),
                  const OptionRow(selected: false, disabled: true, title: "Delete my profile"),
                  OptionRow(
                    selected: false,
                    title: "Logout",
                    onSelect: () => confirmDialog(context, onSure: Amplify.Auth.signOut),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
