import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/tree.dart';

import 'path.dart';

final factorNotifier = Provider((ref) {
  final path = ref.watch(PathNotifier.provider);
  final tree = ref.watch(TreeNotifier.provider);
  final selected = tree.findSelected(path);
  return selected.children.mapp((c) => c.goal);
});
