import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_segment/flutter_segment.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/main.dart';
import 'package:prometh_ai/screens/error_screen.dart';
import 'package:prometh_ai/screens/history/history_detail_screen.dart';
import 'package:prometh_ai/screens/recipe/recipe_detail_screen.dart';
import 'package:prometh_ai/screens/recipe/recipe_result_screen.dart';
import 'package:prometh_ai/screens/refine/refine_screen.dart';
import 'package:prometh_ai/screens/start/start_screen.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/tracking.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/state/user_name.dart';
import 'package:prometh_ai/utils/page_creator.dart';

import 'recipe/schedule_later_screen.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNameNotifier = ref.read(UserNameNotifier.provider.notifier);
    final appState = ref.watch(AppStateNotifier.provider);
    final error = ref.watch(ErrorNotifier.provider);

    enableTracking(TrackingNotifier trackingNotifier) async {
      if (await AppTrackingTransparency.trackingAuthorizationStatus == TrackingStatus.notDetermined) {
        final result = await AppTrackingTransparency.requestTrackingAuthorization();
        trackingNotifier.setTracking(result == TrackingStatus.authorized);
      }
    }

    useEffect(() {
      final userNotifier = ref.read(UserIdNotifier.provider.notifier);
      final trackingNotifier = ref.read(TrackingNotifier.provider.notifier);
      Amplify.Auth.getCurrentUser().then((user) {
        userNotifier.reset(user.userId);
      });
      userNameNotifier.initialize();
      trackingNotifier.init(sharedPreferences!);
      enableTracking(trackingNotifier);
      return null;
    }, []);

    useEffect(() {
      Segment.track(eventName: 'Navigate', properties: {'screen': appState.name});
      return null;
    }, [appState]);

    return Navigator(
      onPopPage: (route, result) => false,
      pages: [
        if (appState.index >= AppState.start.index) pageCreator(const StartScreen()),
        if (appState.index >= AppState.refine.index) pageCreator(const RefineScreen()),
        if (appState.index == AppState.historyDetail.index) pageCreator(const HistoryDetailScreen()),
        if (appState.index >= AppState.recipe.index) pageCreator(const RecipeResultScreen()),
        if (appState.index >= AppState.recipeDetail.index) pageCreator(const RecipeDetailScreen()),
        if (appState.index >= AppState.scheduleLater.index) pageCreator(const ScheduleLaterScreen()),
        if (error != null) pageCreator(const ErrorScreen()),
      ],
    );
  }
}
