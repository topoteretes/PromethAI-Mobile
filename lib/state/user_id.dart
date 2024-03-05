import 'package:flutter_segment/flutter_segment.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserIdNotifier extends StateNotifier<String> {
  static const key = "user_id";
  final Ref ref;
  static final provider = StateNotifierProvider<UserIdNotifier, String?>(UserIdNotifier.new);

  UserIdNotifier(this.ref) : super("");

  init(SharedPreferences sharedPreferences) {
    state = sharedPreferences.getString(key) ?? "";
    Segment.identify(userId: state);
  }
}
