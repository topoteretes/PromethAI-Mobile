import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:prometh_ai/ext/string_ext.dart';
import 'package:prometh_ai/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserIdNotifier extends StateNotifier<String> {
  static const _key = "user_id";
  final Ref ref;
  static final provider = StateNotifierProvider<UserIdNotifier, String?>(UserIdNotifier.new);

  UserIdNotifier(this.ref) : super("");
  SharedPreferences? _sharedPreferences;

  init(SharedPreferences sharedPreferences) {
    _sharedPreferences = sharedPreferences;
    state = _sharedPreferences?.getString(_key) ?? "";
    if (state.isBlank) {
      state = uuid();
      _sharedPreferences?.setString(_key, state);
    }
  }
}
