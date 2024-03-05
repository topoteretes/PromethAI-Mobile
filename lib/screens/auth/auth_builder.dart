import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/startup.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aback_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

class CustomScaffold extends HookConsumerWidget {
  const CustomScaffold({
    super.key,
    required this.title,
    required this.state,
    required this.body,
    this.footer,
  });

  final String title;
  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startupNotifier = ref.read(StartupNotifier.provider.notifier);
    return Scaffold(
      backgroundColor: C.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ABackButton(
                  title: 'Back',
                  onTap: startupNotifier.welcome,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  title,
                  style: tt(context).titleLarge!.copyWith(color: C.black),
                  textAlign: TextAlign.start,
                ),
              ),
              const SizedBox(height: 8),
              Container(width: double.infinity, height: 1, color: C.grey4),
              const SizedBox(height: 56),
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: body,
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: footer != null ? [footer!] : null,
    );
  }
}

Widget? authBuilder(BuildContext context, AuthenticatorState state) {
  switch (state.currentStep) {
    case AuthenticatorStep.signIn:
      return CustomScaffold(
        title: "Sign In",
        state: state,
        body: SignInForm(),
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Don\'t have an account?'),
            TextButton(
              onPressed: () => state.changeStep(
                AuthenticatorStep.signUp,
              ),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      );
    case AuthenticatorStep.signUp:
      return CustomScaffold(
        title: "Sign up",
        state: state,
        body: SignUpForm.custom(fields: [
          SignUpFormField.username(),
          SignUpFormField.password(),
        ]),
        footer: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Already have an account?'),
            TextButton(
              onPressed: () => state.changeStep(
                AuthenticatorStep.signIn,
              ),
              child: const Text('Sign In'),
            ),
          ],
        ),
      );
    case AuthenticatorStep.confirmSignUp:
      return CustomScaffold(
        title: "Confirm signup",
        state: state,
        body: ConfirmSignUpForm(),
      );
    case AuthenticatorStep.resetPassword:
      return CustomScaffold(
        title: "Reset password",
        state: state,
        body: ResetPasswordForm(),
      );
    case AuthenticatorStep.confirmResetPassword:
      return CustomScaffold(
        title: "Conform reset password",
        state: state,
        body: const ConfirmResetPasswordForm(),
      );
    default:
      return null;
  }
}
