import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserNameNotifier extends StateNotifier<String?> {
  final Ref ref;
  static final provider = StateNotifierProvider<UserNameNotifier, String?>(UserNameNotifier.new);

  UserNameNotifier(this.ref) : super(null);

  initialize() async {
    try {
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
    state = "";
  }

  update(String newName) async {
    try {
      final result = await Amplify.Auth.updateUserAttribute(
        userAttributeKey: AuthUserAttributeKey.name,
        value: newName,
      );
      state = newName;
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
}
