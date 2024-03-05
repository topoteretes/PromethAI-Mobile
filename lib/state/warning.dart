import 'package:flutter_riverpod/flutter_riverpod.dart';

class WarningNotifier extends StateNotifier<bool> {
  final Ref ref;
  static final provider = StateNotifierProvider<WarningNotifier, bool>(WarningNotifier.new);

  WarningNotifier(this.ref) : super(false);

  show() => state = true;
  hide() => state = false;
}
