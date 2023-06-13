import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

class CustomScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 40),
                const VecPic(
                  "big_logo",
                  iconSize: 85,
                  color: C.front,
                ),
                const SizedBox(height: 40),
                Text(
                  title,
                  style: tt(context).titleMedium!.copyWith(color: C.black),
                ),
                const SizedBox(height: 16),
                Text(
                  "Your assistant learns as you go.\nBenefit from its learning capabilities\nby creating a free account today.",
                  textAlign: TextAlign.center,
                  style: tt(context).bodySmall!.copyWith(color: C.black),
                ),
                const SizedBox(height: 32),
                Container(
                  constraints: const BoxConstraints(maxWidth: 600),
                  child: body,
                ),
              ],
            ),
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
        title: "Sign in",
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
