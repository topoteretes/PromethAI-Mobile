import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNotifier extends StateNotifier<int> {
  final Ref ref;
  static final provider = StateNotifierProvider<TabNotifier, int>(TabNotifier.new);

  TabNotifier(this.ref) : super(0);

  setTab(int tab) => state = tab;
}
