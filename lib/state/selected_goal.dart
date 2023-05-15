import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/path.dart';

import 'tree.dart';

final selectedGoalNotifier = Provider((ref) {
  final path = ref.watch(PathNotifier.provider);
  final tree = ref.watch(TreeNotifier.provider);
  return tree.findSelected(path);
});
