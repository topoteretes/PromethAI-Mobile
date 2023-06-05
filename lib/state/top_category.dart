import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopCategoryNotifier extends StateNotifier<String> {
  final Ref ref;
  static final provider = StateNotifierProvider<TopCategoryNotifier, String>(TopCategoryNotifier.new);

  TopCategoryNotifier(this.ref) : super("");

  update(String category) => state = category;
}
