import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:prometh_ai/screens/error_screen.dart';
import 'package:prometh_ai/screens/recipe/recipe_result_screen.dart';
import 'package:prometh_ai/screens/refine/refine_screen.dart';
import 'package:prometh_ai/screens/start/start_screen.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/utils/page_creator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(AppStateNotifier.provider);
    final error = ref.watch(ErrorNotifier.provider);

    useEffect(() {
      final userNotifier = ref.read(UserIdNotifier.provider.notifier);
      Amplify.Auth.getCurrentUser().then((user) {
        userNotifier.reset(user.userId);
      });
      return null;
    }, []);
    return Navigator(
      onPopPage: (route, result) => false,
      pages: [
        if (appState.index >= AppState.start.index) pageCreator(const StartScreen()),
        if (appState.index >= AppState.refine.index) pageCreator(const RefineScreen()),
        if (appState == AppState.result) pageCreator(const RecipeResultScreen()),
        if (error != null) pageCreator(const ErrorScreen()),
      ],
    );
  }
}
