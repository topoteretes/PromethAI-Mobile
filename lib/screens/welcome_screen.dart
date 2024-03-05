import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/amplifyconfiguration.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/skip_auth.dart';
import 'package:prometh_ai/state/startup.dart';
import 'package:prometh_ai/state/user_email.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/texts/large_body.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

_configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
  ]);
  await Amplify.configure(amplifyconfig);
}

class WelcomeScreen extends HookConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupNotifier = ref.read(StartupNotifier.provider.notifier);
    final skipAuthNotifier = ref.read(SkipAuthNotifier.provider.notifier);

    final isSetup = useState(true);

    setup() async {
      await _configureAmplify();
      final userEmailNotifier = ref.read(UserEmailNotifier.provider.notifier);
      final isLoggedIn = await userEmailNotifier.initialize();
      if (isLoggedIn) {
        skipAuthNotifier.skip();
      }
      isSetup.value = false;
    }

    useEffect(() {
      setup();
      return null;
    }, []);

    return Scaffold(
        backgroundColor: C.white,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedOpacity(
                  duration: A.normal,
                  opacity: isSetup.value ? 0 : 1,
                  curve: CV.normal,
                  child: AnimatedSlide(
                    duration: A.normal,
                    offset: Offset(0, isSetup.value ? 1 : 0),
                    curve: CV.normal,
                    child: Column(
                      children: [
                        const Spacer(flex: 2),
                        const NormalTitle("Welcome to MealWiz!"),
                        const SizedBox(height: 32),
                        const Padding(
                          padding: EdgeInsets.only(left: 32, right: 32),
                          child: LargeBody("A place for personalised, mouthwatering food suggestions that perfectly fit your lifestyle."),
                        ),
                        const Spacer(flex: 1),
                        SizedBox(width: 254, child: AButton(title: "Create account", onPressed: startupNotifier.signup)),
                        const SizedBox(height: 12),
                        SizedBox(
                            width: 254, child: AButton(title: "Log in", outline: true, inverted: true, onPressed: startupNotifier.login)),
                        const SizedBox(height: 16),
                        InkWell(
                            onTap: skipAuthNotifier.skip,
                            child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                child: const LargeBody("Skip and go to your meal", color: C.front, bold: true))),
                        const SizedBox(height: 32)
                      ],
                    ),
                  ),
                ),
                AnimatedSlide(
                  duration: A.normal,
                  offset: Offset(0, isSetup.value ? 0 : -1),
                  curve: CV.normal,
                  child: const Image(
                      width: 200,
                      height: 200,
                      image: AssetImage(
                        'assets/images/logo.png',
                      )),
                ),
                if (isSetup.value)
                  const Padding(
                    padding: EdgeInsets.only(top: 164),
                    child: Progress(),
                  )
              ],
            ),
          ),
        ));
  }
}
