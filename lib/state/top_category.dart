import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_segment/flutter_segment.dart';

class TopCategoryNotifier extends StateNotifier<String> {
  final Ref ref;
  static final provider = StateNotifierProvider<TopCategoryNotifier, String>(TopCategoryNotifier.new);

  TopCategoryNotifier(this.ref) : super("");

  update(String category) {
    Segment.track(eventName: 'Change top category', properties: {'category': category});
    state = category;
  }
}
