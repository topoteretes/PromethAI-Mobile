import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/screens/home_screen.dart';
import 'package:prometh_ai/theme.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'amplifyconfiguration.dart';
import 'state/init_store.dart';

final _deviceInfo = DeviceInfoPlugin();
var isSimulator = false;

final isTest = Platform.environment.containsKey('FLUTTER_TEST');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS && kDebugMode) {
    var iosInfo = await _deviceInfo.iosInfo;
    isSimulator = !iosInfo.isPhysicalDevice;
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: C.back, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
      ));

  await initStore();
  try {
    await _configureAmplify();
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }
  runApp(const App());
}

_configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
  ]);
  await Amplify.configure(amplifyconfig);
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      await Amplify.addPlugin(auth);

      // call Amplify.configure to use the initialized categories in your app
      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: Authenticator(
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: Authenticator.builder(),
            theme: theme,
            home: const HomeScreen(),
          ),
        ),
      );
}
