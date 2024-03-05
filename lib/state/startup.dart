import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';

enum Startup { welcome, login, signup }

class StartupNotifier extends StateNotifier<Startup> {
  static final provider = StateNotifierProvider<StartupNotifier, Startup>(StartupNotifier.init);

  static StartupNotifier init(Ref ref) => StartupNotifier(ref);

  final Ref ref;

  StartupNotifier(this.ref) : super(Startup.welcome);

  login() async {
    await Amplify.Auth.signOut();
    state = Startup.login;
  }

  signup() async {
    await Amplify.Auth.signOut();
    state = Startup.signup;
  }

  welcome() async {
    await Amplify.Auth.signOut();
    state = Startup.welcome;
  }
}
