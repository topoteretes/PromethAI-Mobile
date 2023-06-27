import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackingNotifier extends StateNotifier<bool> {
  final Ref ref;
  static final provider = StateNotifierProvider<TrackingNotifier, bool>(TrackingNotifier.new);

  TrackingNotifier(this.ref) : super(false);

  static const attKey = "att";
  static const segmentKey = "segment_tracking";

  SharedPreferences? _sharedPreferences;

  init(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
    state = _attEnabled() && _segmentEnabled();
  }

  bool _attEnabled() => _sharedPreferences?.getBool(attKey) ?? false;
  bool _segmentEnabled() => _sharedPreferences?.getBool(segmentKey) ?? true;

  toggle() => setTracking(!state);

  setTracking(bool enabled) {
    state = enabled;
    if (state && _attEnabled()) {
      Segment.enable();
    } else {
      Segment.disable();
    }
    _sharedPreferences?.setBool(segmentKey, state);
  }
}
