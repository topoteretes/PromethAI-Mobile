import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/main.dart';
import 'package:prometh_ai/screens/error_screen.dart';
import 'package:prometh_ai/screens/start_screen/start_screen.dart';
import 'package:prometh_ai/screens/warning/warning_screen.dart';
import 'package:prometh_ai/state/access_token.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/skip_auth.dart';
import 'package:prometh_ai/state/tab.dart';
import 'package:prometh_ai/state/tracking.dart';
import 'package:prometh_ai/state/user_email.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/state/user_name.dart';
import 'package:prometh_ai/state/warning.dart';
import 'package:prometh_ai/widget/progress.dart';

import '../env/.env.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameNotifier = ref.read(UserNameNotifier.provider.notifier);
    final appState = ref.watch(AppStateNotifier.provider);
    final error = ref.watch(ErrorNotifier.provider);
    final warning = ref.watch(WarningNotifier.provider);
    final isSetup = useState(true);
    final authSub = useRef<StreamSubscription<AuthHubEvent>?>(null);

    setup() async {
      isSetup.value = true;
      final userNotifier = ref.read(UserIdNotifier.provider.notifier);
      final trackingNotifier = ref.read(TrackingNotifier.provider.notifier);
      final userEmailNotifier = ref.read(UserEmailNotifier.provider.notifier);

      trackingNotifier.init(sharedPreferences!);
      userNotifier.init(sharedPreferences!);

      final skipAuth = ref.read(SkipAuthNotifier.provider);
      if (skipAuth) {
        try {
          await Amplify.Auth.signIn(username: Environment.guestUsername, password: Environment.guestPassword);
        } catch (e) {
          // Fail silently if anonymous user is already logged in
        }
      }

      userEmailNotifier.initialize();
      userNameNotifier.initialize();

      final result = await Amplify.Auth.fetchAuthSession() as CognitoAuthSession;
      final accessTokenNotifier = ref.read(AccessTokenNotifier.provider.notifier);
      final accessToken = result.userPoolTokensResult.value.accessToken.raw;
      accessTokenNotifier.store(accessToken);
      isSetup.value = false;
    }

    useEffect(() {
      setup();
      authSub.value = Amplify.Hub.listen(HubChannel.Auth, (AuthHubEvent event) {
        final tabNotifier = ref.read(TabNotifier.provider.notifier);
        tabNotifier.setTab(0);
        setup();
      });
      return null;
    }, []);

    useEffect(() {
      Segment.track(eventName: 'Navigate', properties: {'screen': appState.name});
      return null;
    }, [appState]);

    return Stack(
      children: [
        isSetup.value ? const Center(child: Progress()) : const StartScreen(),
        if (warning) const WarningScreen(),
        if (error != null && !error.contains("was cancelled")) const ErrorScreen(),
      ],
    );
  }
}
