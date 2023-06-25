import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackingNotifier extends StateNotifier<bool> {
  final Ref ref;
  static final provider = StateNotifierProvider<TrackingNotifier, bool>(TrackingNotifier.new);

  TrackingNotifier(this.ref) : super(false);

  static const _key = "segment_tracking";

  SharedPreferences? _sharedPreferences;

  init(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
    state = _sharedPreferences?.getBool(_key) ?? false;
  }

  toggle() => setTracking(!state);

  setTracking(bool enabled) {
    state = enabled;
    if (state) {
      Segment.disable();
    } else {
      Segment.enable();
    }
    _sharedPreferences?.setBool(_key, state);
  }
}
