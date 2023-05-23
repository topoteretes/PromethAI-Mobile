import 'package:flutter/widgets.dart';
import 'package:prometh_ai/ext/int_ext.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/screens/error_screen.dart';
import 'package:prometh_ai/screens/goal/goal_screen.dart';
import 'package:prometh_ai/screens/result/result_screen.dart';
import 'package:prometh_ai/screens/start/start_screen.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/utils/page_creator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'result/recipe_detail.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(AppStateNotifier.provider);
    final error = ref.watch(ErrorNotifier.provider);
    final levels = ref.watch(PathNotifier.provider.select((path) => 1.upTo(path.length)));
    return Navigator(
      onPopPage: (route, result) => false,
      pages: [
        if (appState.index >= AppState.start.index) pageCreator(const StartScreen()),
        if (appState.index >= AppState.goal.index) ...levels.mapp((i) => pageCreator(GoalScreen(pathTop: i), key: i.toString())),
        if (appState.index >= AppState.result.index) pageCreator(const ResultScreen()),
        if (appState.index >= AppState.recipeDetail.index) pageCreator(const RecipeDetailScreen()),
        if (error != null) pageCreator(const ErrorScreen()),
      ],
    );
  }
}
