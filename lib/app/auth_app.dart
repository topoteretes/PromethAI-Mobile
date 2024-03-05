import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';
import 'package:prometh_ai/screens/auth/auth_builder.dart';
import 'package:prometh_ai/state/startup.dart';

import 'base_app.dart';

class AuthApp extends StatelessWidget {
  final Startup startup;

  const AuthApp({super.key, required this.startup});

  @override
  Widget build(BuildContext context) => Authenticator(
        authenticatorBuilder: authBuilder,
        initialStep: startup == Startup.signup ? AuthenticatorStep.signUp : AuthenticatorStep.signIn,
        child: const BaseApp(auth: true),
      );
}
