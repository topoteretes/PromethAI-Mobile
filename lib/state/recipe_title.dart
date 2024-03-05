import 'package:hydrated_riverpod/hydrated_riverpod.dart';

class RecipeTitleNotifier extends HydratedStateNotifier<Map<String, String>> {
  static const _key = 'RecipeTitle';
  static final provider = StateNotifierProvider<RecipeTitleNotifier, Map<String, String>>(RecipeTitleNotifier.init);

  static RecipeTitleNotifier init(Ref ref) => RecipeTitleNotifier(ref);

  final Ref ref;

  String lastRecipe = "";

  RecipeTitleNotifier(this.ref) : super({});

  @override
  Map<String, String> fromJson(Map<String, dynamic> json) => json[_key] == null ? {} : Map<String, String>.from(json[_key]);

  @override
  Map<String, dynamic> toJson(state) => {_key: state};

  store(String prompt, String recipe) {
    lastRecipe = recipe;
    state = {...state, prompt: recipe};
  }
}
