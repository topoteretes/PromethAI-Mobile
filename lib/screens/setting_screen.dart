import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/history.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/state/session_id.dart';
import 'package:prometh_ai/state/skip_auth.dart';
import 'package:prometh_ai/state/startup.dart';
import 'package:prometh_ai/state/tracking.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/state/user_email.dart';
import 'package:prometh_ai/state/user_name.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/compose.dart';
import 'package:prometh_ai/widget/confirm_dialog.dart';
import 'package:prometh_ai/widget/input_text.dart';
import 'package:prometh_ai/widget/option_row.dart';
import 'package:prometh_ai/widget/option_toggle_row.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

class SettingScreen extends HookConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyNotifier = ref.read(HistoryNotifier.provider.notifier);
    final sessionIdNotifier = ref.read(SessionIdNotifier.provider.notifier);
    final userNameNotifier = ref.read(UserNameNotifier.provider.notifier);
    final trackingNotifier = ref.read(TrackingNotifier.provider.notifier);
    final startupNotifier = ref.read(StartupNotifier.provider.notifier);
    final skipAuthNotifier = ref.read(SkipAuthNotifier.provider.notifier);
    final isLoggedIn = ref.watch(isLoggedInProvider);

    final userName = ref.watch(UserNameNotifier.provider);
    final controller = useTextEditingController();
    final tracking = ref.watch(TrackingNotifier.provider);

    cleanup() {
      final treeNotifier = ref.read(TreeNotifier.provider.notifier);
      final promptNotifier = ref.read(PromptNotifier.provider.notifier);
      final pathNotifier = ref.read(PathNotifier.provider.notifier);
      final userNameNotifier = ref.read(UserNameNotifier.provider.notifier);
      final userEmailNotifier = ref.read(UserEmailNotifier.provider.notifier);
      final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
      appStateNotifier.start();
      historyNotifier.cleanup();
      userNameNotifier.cleanup();
      userEmailNotifier.cleanup();
      treeNotifier.cleanup();
      promptNotifier.cleanup();
      pathNotifier.cleanup();
      startupNotifier.welcome();
      skipAuthNotifier.unskip();
    }

    useEffect(() {
      userNameNotifier.initialize();
      return null;
    }, []);

    useEffect(() {
      if (userName != null) {
        controller.text = userName;
      }
      return null;
    }, [userName]);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const NormalTitle("Account"),
              const Spacer(),
              InputText(
                  onChanged: (_) {},
                  controller: controller,
                  backgroundColor: C.white,
                  placeholder: "Change your name here",
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (f) => userNameNotifier.update(controller.text)),
              const SizedBox(height: M.normal),
              OptionToggleRow(selected: tracking, title: "Analytics", onToggle: trackingNotifier.toggle),
              OptionRow(selected: false, title: "Clear history", onSelect: () => confirmDialog(context, onSure: historyNotifier.cleanup)),
              OptionRow(selected: false, title: "Clear session", onSelect: () => confirmDialog(context, onSure: sessionIdNotifier.reset)),
              if (isLoggedIn)
                OptionRow(
                  selected: false,
                  title: "Delete my profile",
                  onSelect: () => confirmDialog(context, onSure: compose(cleanup, Amplify.Auth.deleteUser)),
                ),
              if (isLoggedIn)
                OptionRow(
                  selected: false,
                  title: "Log out",
                  onSelect: () => confirmDialog(context, onSure: compose(cleanup, Amplify.Auth.signOut)),
                ),
              if (isLoggedIn && kDebugMode)
                OptionRow(
                  selected: false,
                  title: "Zapier auth",
                  onSelect: () => compose(cleanup, Amplify.Auth.signOut),
                ),
              if (!isLoggedIn)
                OptionRow(
                  selected: false,
                  title: "Log in",
                  onSelect: compose(startupNotifier.login, skipAuthNotifier.unskip),
                ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
