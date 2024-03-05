import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:prometh_ai/state/user_email.dart';

class UserNameNotifier extends HydratedStateNotifier<String?> {
  static const key = "UserName_2";
  final Ref ref;
  static final provider = StateNotifierProvider<UserNameNotifier, String?>(UserNameNotifier.new);

  UserNameNotifier(this.ref) : super(null);

  initialize() async {
    try {
      final isLoggedIn = ref.read(isLoggedInProvider);
      if (!isLoggedIn) {
        return;
      }
      final result = await Amplify.Auth.fetchUserAttributes();
      for (final element in result) {
        if (AuthUserAttributeKey.name == element.userAttributeKey) {
          state = element.value;
          return;
        }
      }
    } on AuthException catch (e) {
      safePrint('Error fetching user attributes: ${e.message}');
    }
  }

  update(String newName) async {
    final isLoggedIn = ref.read(isLoggedInProvider);
    try {
      state = newName;
      if (!isLoggedIn) {
        return;
      }
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: AuthUserAttributeKey.name,
        value: newName,
      );
      _handleUpdateUserAttributeResult(result);
    } on AuthException catch (e) {
      safePrint('Error updating user attribute: ${e.message}');
    }
  }

  _handleUpdateUserAttributeResult(UpdateUserAttributeResult result) {
    switch (result.nextStep.updateAttributeStep) {
      case AuthUpdateAttributeStep.confirmAttributeWithCode:
        final codeDeliveryDetails = result.nextStep.codeDeliveryDetails!;
        _handleCodeDelivery(codeDeliveryDetails);
        break;
      case AuthUpdateAttributeStep.done:
        safePrint('Successfully updated attribute');
        break;
    }
  }

  _handleCodeDelivery(AuthCodeDeliveryDetails codeDeliveryDetails) => safePrint(
        'A confirmation code has been sent to ${codeDeliveryDetails.destination}. '
        'Please check your ${codeDeliveryDetails.deliveryMedium.name} for the code.',
      );

  cleanup() => state = null;

  @override
  String? fromJson(Map<String, dynamic> json) => json[key];

  @override
  Map<String, dynamic> toJson(String? state) => {key: state};
}
