import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/tree.dart';

import 'path.dart';

final menuGoalsNotifier = Provider((ref) {
  final path = ref.watch(PathNotifier.provider);
  final tree = ref.watch(TreeNotifier.provider);
  return tree.findMenu(path);
});
