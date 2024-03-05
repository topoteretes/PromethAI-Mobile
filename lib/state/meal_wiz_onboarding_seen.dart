import 'package:hydrated_riverpod/hydrated_riverpod.dart';

class MealWizOnboardingSeenNotifier extends StateNotifier<bool> {
  static final provider = StateNotifierProvider<MealWizOnboardingSeenNotifier, bool>(MealWizOnboardingSeenNotifier.init);

  static MealWizOnboardingSeenNotifier init(Ref ref) => MealWizOnboardingSeenNotifier(ref);

  final Ref ref;

  MealWizOnboardingSeenNotifier(this.ref) : super(false);
/*
  @override
  bool fromJson(Map<String, dynamic> json) => json[_key] == true;

  @override
  Map<String, dynamic> toJson(bool state) => {_key: state};*/

  seen() => state = true;
}
