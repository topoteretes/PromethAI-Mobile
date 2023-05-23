import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserIdNotifier extends StateNotifier<String?> {
  final Ref ref;
  static final provider = StateNotifierProvider<UserIdNotifier, String?>(UserIdNotifier.new);

  UserIdNotifier(this.ref) : super(null);
}
