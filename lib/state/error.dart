import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorNotifier extends StateNotifier<String?> {
  final Ref ref;
  static final provider = StateNotifierProvider<ErrorNotifier, String?>(ErrorNotifier.new);

  ErrorNotifier(this.ref) : super(null);
  store(String error) => state = error;
  reset() => state = null;
}
