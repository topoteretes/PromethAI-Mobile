import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';

import '../env/.env.dart';

final isLoggedInProvider = Provider((ref) {
  final value = ref.watch(UserEmailNotifier.provider);
  return _isLoggedIn(value);
});

bool _isLoggedIn(String? value) => value != null && value != Environment.guestUsername;

class UserEmailNotifier extends StateNotifier<String?> {
  final Ref ref;
  static final provider = StateNotifierProvider<UserEmailNotifier, String?>(UserEmailNotifier.new);

  UserEmailNotifier(this.ref) : super(null);

  initialize() async {
    try {
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        if (AuthUserAttributeKey.email == element.userAttributeKey) {
          state = element.value;
          return _isLoggedIn(state);
        }
      }
    } on AuthException catch (e) {
      safePrint('Error fetching user attributes: ${e.message}');
    }
    return false;
  }

  cleanup() => state = null;
}
