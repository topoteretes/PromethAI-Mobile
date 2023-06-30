import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:prometh_ai/screens/home_screen.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/theme.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:prometh_ai/utils/after_delay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'amplifyconfiguration.dart';
import 'env/.env.dart';
import 'state/init_store.dart';
import 'state/tracking.dart';

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

  sharedPreferences = await SharedPreferences.getInstance();

  var trackingStatus = await AppTrackingTransparency.trackingAuthorizationStatus;
  if (trackingStatus == TrackingStatus.notDetermined) {
    trackingStatus = await AppTrackingTransparency.requestTrackingAuthorization();
    final trackingEnabled = trackingStatus == TrackingStatus.authorized;
    sharedPreferences?.setBool(TrackingNotifier.attKey, trackingEnabled);

    final id = trackingEnabled ? await AppTrackingTransparency.getAdvertisingIdentifier() : uuid();
    sharedPreferences?.setString(UserIdNotifier.key, id);
  }

  try {
    await _configureAmplify();
    _configureSegment();
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

_configureSegment() => Segment.config(
      options: SegmentConfig(
        writeKey: Environment.segmentApiKey,
        trackApplicationLifecycleEvents: true,
        amplitudeIntegrationEnabled: false,
        debug: true,
      ),
    );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => ProviderScope(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: const HomeScreen(),
        ),
      );

  /*  @override
  // Cognito Authenticator
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
      );*/
}
