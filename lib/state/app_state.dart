import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppState {
  start,
  initialGoals,
  goal,
  prevJourneys,
  result,
  recipeDetail,
}

class AppStateNotifier extends StateNotifier<AppState> {
  static final provider = StateNotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);
  final Ref ref;

  AppStateNotifier(this.ref) : super(AppState.start);

  goal() => state = AppState.goal;
  initialGoals() => state = AppState.initialGoals;
  start() => state = AppState.start;
  prevJourneys() => state = AppState.prevJourneys;
  result() => state = AppState.result;
  recipeDetail() => state = AppState.recipeDetail;
}
