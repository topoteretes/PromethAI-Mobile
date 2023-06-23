import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:prometh_ai/screens/home_screen.dart';
import 'package:prometh_ai/theme.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'amplifyconfiguration.dart';
import 'screens/auth/auth_builder.dart';
import 'settings.dart';
import 'state/init_store.dart';

final _deviceInfo = DeviceInfoPlugin();
var isSimulator = false;
SharedPreferences? sharedPreferences;

final isTest = Platform.environment.containsKey('FLUTTER_TEST');

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS && kDebugMode) {
    var iosInfo = await _deviceInfo.iosInfo;
    isSimulator = !iosInfo.isPhysicalDevice;
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: C.front, // Color for Android
      statusBarBrightness: Brightness.light // Dark == white status bar -- for IOS.
      ));

  await initStore();
  try {
    await _configureAmplify();
    _configureSegment();
  } on AmplifyAlreadyConfiguredException {
    debugPrint('Amplify configuration failed.');
  }

  sharedPreferences = await SharedPreferences.getInstance();

  runApp(const App());

/*  if (await AppTrackingTransparency.trackingAuthorizationStatus == TrackingStatus.notDetermined) {
    final result = await AppTrackingTransparency.requestTrackingAuthorization();
  }*/
}

_configureAmplify() async {
  await Amplify.addPlugins([
    AmplifyAuthCognito(),
  ]);
  await Amplify.configure(amplifyconfig);
}

_configureSegment() {
  Segment.config(
    options: SegmentConfig(
      writeKey: S.segmentApiKey,
      trackApplicationLifecycleEvents: true,
      amplitudeIntegrationEnabled: false,
      debug: true,
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: Authenticator(
          authenticatorBuilder: authBuilder,
          child: MaterialApp(
            builder: Authenticator.builder(),
            debugShowCheckedModeBanner: false,
            theme: theme,
            home: const HomeScreen(),
          ),
        ),
      );
}
