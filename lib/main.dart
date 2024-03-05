import 'dart:io';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:path_provider/path_provider.dart';
import 'package:prometh_ai/app/app.dart';
import 'package:prometh_ai/ext/date_time_ext.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'env/.env.dart';
import 'state/init_store.dart';
import 'state/tracking.dart';

final _deviceInfo = DeviceInfoPlugin();
var isSimulator = false;
CacheOptions? dioCacheOptions;
SharedPreferences? sharedPreferences;

final isTest = Platform.environment.containsKey('FLUTTER_TEST');

_configureSegment() {
  Segment.config(
    options: SegmentConfig(
      writeKey: Environment.segmentApiKey,
      trackApplicationLifecycleEvents: true,
      amplitudeIntegrationEnabled: false,
      debug: false,
    ),
  );
  Segment.disable();
}

_dioCacheSetup() async {
  final dioCacheDir = await getTemporaryDirectory();
  final cacheStore = HiveCacheStore(
    dioCacheDir.path,
    hiveBoxName: "your_app_name",
  );

  dioCacheOptions = CacheOptions(
    store: cacheStore,
    policy: CachePolicy.forceCache,
    priority: CachePriority.high,
    maxStale: const Duration(minutes: 5),
    hitCacheOnErrorExcept: [401, 404, 304],
    keyBuilder: (request) {
      if (request.uri.host.contains("replicate")) {
        return DateTimeExt.timestamp().toString();
      }
      return "${request.uri.toString()}${stringify(request.data)}".hashCode.toString();
    },
    allowPostMethod: true,
  );
}

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS && kDebugMode) {
    var iosInfo = await _deviceInfo.iosInfo;
    isSimulator = !iosInfo.isPhysicalDevice;
  }

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Color for Android
      statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
      ));

  await _dioCacheSetup();
  await initStore();

  sharedPreferences = await SharedPreferences.getInstance();

  _configureSegment();

  var trackingStatus = await AppTrackingTransparency.trackingAuthorizationStatus;
  if (trackingStatus == TrackingStatus.notDetermined) {
    await Future.delayed(const Duration(seconds: 1));
    trackingStatus = await AppTrackingTransparency.requestTrackingAuthorization();
    final trackingEnabled = trackingStatus == TrackingStatus.authorized;
    sharedPreferences?.setBool(TrackingNotifier.attKey, trackingEnabled);

    final advertisingIdentifier = await AppTrackingTransparency.getAdvertisingIdentifier();

    final id = trackingEnabled && advertisingIdentifier != "00000000-0000-0000-0000-000000000000"
        ? await AppTrackingTransparency.getAdvertisingIdentifier()
        : await Segment.getAnonymousId ?? uuid();

    sharedPreferences?.setString(UserIdNotifier.key, id);
  }

  runApp(const App());
}
