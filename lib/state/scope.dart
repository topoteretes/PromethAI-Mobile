import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScopeNotifier extends StateNotifier<bool> {
  final Ref ref;
  static final provider = StateNotifierProvider<ScopeNotifier, bool>(ScopeNotifier.new);

  ScopeNotifier(this.ref) : super(false);
  toggle() => state = !state;
}
