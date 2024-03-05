import 'package:hydrated_riverpod/hydrated_riverpod.dart';

final sessionId = Provider((ref) {
  final value = ref.watch(SessionIdNotifier.provider.select((value) => value));
  return value.toString();
});

class SessionIdNotifier extends HydratedStateNotifier<int> {
  static const key = 'SessionId_3';
  static final provider = StateNotifierProvider<SessionIdNotifier, int>(SessionIdNotifier.init);

  static SessionIdNotifier init(Ref ref) => SessionIdNotifier(ref);

  final Ref ref;

  SessionIdNotifier(this.ref) : super(1);

  @override
  int fromJson(Map<String, dynamic> json) => json[key] == null ? 1 : (int.parse(json[key]));

  @override
  Map<String, dynamic> toJson(int state) => {key: state.toString()};

  reset() => state = state + 1;
}
