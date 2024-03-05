import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopScrollBlockNotifier extends StateNotifier<bool> {
  final Ref ref;
  static final provider = StateNotifierProvider<TopScrollBlockNotifier, bool>(TopScrollBlockNotifier.new);

  TopScrollBlockNotifier(this.ref) : super(false);

  block() => state = true;
  release() => state = false;
}
