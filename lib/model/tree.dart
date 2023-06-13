import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tree.freezed.dart';
part 'tree.g.dart';

@freezed
class Tree with _$Tree {
  const factory Tree({
    required String category,
    @Default([]) List<Tree> options,
    @Default([]) List<String> preference,
  }) = _Node;

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);
}

extension Ext on Tree {
  Tree updateSubTree(List<String> path, Tree subTree) {
    if (path.isEmpty) {
      return subTree;
    }

    final index = options.indexWhere((s) => s.category == path.first);
    if (index == -1) {
      return this;
    }
    final child = options[index];
    final updatedChild = child.updateSubTree([...path]..removeAt(0), subTree);
    final newOptions = [...options];
    newOptions[index] = updatedChild;
    return copyWith(options: newOptions);
  }

  List<Tree> getTreeList(List<String> path) {
    var result = [this];
    for (var segment in path) {
      final topTree = result.last;

      final nextTree = topTree.options.firstWhereOrNull((c) => c.category == segment);
      result = nextTree != null ? [...result, nextTree] : result;
    }
    return result;
  }

  Tree getLeaf(List<String> path) => getTreeList(path).last;
}
