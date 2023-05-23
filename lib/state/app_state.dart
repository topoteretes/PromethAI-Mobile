import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppState {
  start,
  goal,
  result,
  recipeDetail,
}

class AppStateNotifier extends StateNotifier<AppState> {
  static final provider = StateNotifierProvider<AppStateNotifier, AppState>(AppStateNotifier.new);
  final Ref ref;

  AppStateNotifier(this.ref) : super(AppState.start);

  goal() => state = AppState.goal;
  start() => state = AppState.start;
  result() => state = AppState.result;
  recipeDetail() => state = AppState.recipeDetail;
}
