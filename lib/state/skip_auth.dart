import 'package:flutter_riverpod/flutter_riverpod.dart';

class SkipAuthNotifier extends StateNotifier<bool> {
  final Ref ref;
  static final provider = StateNotifierProvider<SkipAuthNotifier, bool>(SkipAuthNotifier.new);

  SkipAuthNotifier(this.ref) : super(false);

  skip() => state = true;
  unskip() => state = false;
}
