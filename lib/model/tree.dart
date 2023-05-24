import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/name_amount.dart';

part 'tree.freezed.dart';

part 'tree.g.dart';

class TreeRoot {
  static const String cook = "Cook";
  static const String order = "Order";
  static const String eatOut = "Eat out";
}

@freezed
class Tree with _$Tree {
  static const rootName = "ROOT_NAME";
  static const rootAmount = -1000;

  static Tree starter = const Tree(goal: NameAmount(name: rootName, amount: rootAmount), children: [
    Tree(goal: NameAmount(name: TreeRoot.cook, amount: 50), children: []),
    Tree(goal: NameAmount(name: TreeRoot.order, amount: 50), children: []),
    Tree(goal: NameAmount(name: TreeRoot.eatOut, amount: 50), children: []),
  ]);

  const factory Tree({
    required NameAmount goal,
    required List<Tree> children,
  }) = _Tree;

  factory Tree.fromJson(Map<String, dynamic> json) => _$TreeFromJson(json);
}

extension Ext on Tree {
  get name => goal.name;
  get amount => goal.amount;

  Tree updateAmount(List<String> path, int newAmount) {
    if (path.isEmpty) {
      return copyWith(goal: goal.copyWith(amount: newAmount));
    }

    final childIndex = children.indexWhere((c) => c.name == path.first);
    if (childIndex == -1) {
      return this;
    }

    final updatedChild = children[childIndex].updateAmount(path.sublist(1), newAmount);
    final updatedChildren = [...children];
    updatedChildren[childIndex] = updatedChild;
    return copyWith(children: updatedChildren);
  }

  Tree updateChildren(List<String> path, List<Tree> newChildren) {
    if (path.isEmpty) {
      return copyWith(children: newChildren);
    }

    final childIndex = children.indexWhere((c) => c.name == path.first);
    if (childIndex == -1) {
      return this;
    }

    final updatedChild = children[childIndex].updateChildren(path.sublist(1), newChildren);
    final updatedChildren = [...children];
    updatedChildren[childIndex] = updatedChild;
    return copyWith(children: updatedChildren);
  }

  Tree findSelected(List<String> path) {
    var result = this;
    for (var segment in path) {
      result = result.children.firstWhere((c) => c.name == segment);
    }
    return result;
  }

  List<Tree> findMenu(List<String> fullPath) {
    final path = [...fullPath]..removeLast();
    return findSelected(path).children;
  }
}
