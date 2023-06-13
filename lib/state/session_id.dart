import 'package:hydrated_riverpod/hydrated_riverpod.dart';

final sessionId = Provider((ref) {
  final value = ref.watch(SessionIdNotifier.provider.select((value) => value.first));
  return value.toString();
});

class SessionIdNotifier extends HydratedStateNotifier<List<int>> {
  static const key = 'SessionId';
  static final provider = StateNotifierProvider<SessionIdNotifier, List<int>>(SessionIdNotifier.init);

  static SessionIdNotifier init(Ref ref) => SessionIdNotifier(ref);

  final Ref ref;

  SessionIdNotifier(this.ref) : super([1]);

  @override
  List<int> fromJson(Map<String, dynamic> json) => json[key] == null ? [] : (json[key] as List<int>);

  @override
  Map<String, dynamic> toJson(List<int> state) => {key: state};

  reset() => state = [state.first + 1];
}
