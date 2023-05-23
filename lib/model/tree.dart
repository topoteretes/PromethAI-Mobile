import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:prometh_ai/model/name_amount.dart';

part 'tree.freezed.dart';

part 'tree.g.dart';

@freezed
class Tree with _$Tree {
  static const rootName = "ROOT_NAME";
  static const rootAmount = -1000;

  static List<Tree> base = [
    const Tree(goal: NameAmount(name: "Composition", amount: 0), children: []),
    const Tree(goal: NameAmount(name: "Access", amount: 0), children: []),
    const Tree(goal: NameAmount(name: "Cuisine", amount: 0), children: []),
  ];

  static Tree starter = Tree(goal: const NameAmount(name: rootName, amount: rootAmount), children: [
    Tree(goal: const NameAmount(name: "Cook", amount: 0), children: base),
    Tree(goal: const NameAmount(name: "Order", amount: 0), children: base),
    Tree(goal: const NameAmount(name: "Eat out", amount: 0), children: base),
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
      result = result.children.firstWhereOrNull((c) => c.name == segment) ?? Tree.starter;
    }
    return result;
  }

  List<Tree> findMenu(List<String> fullPath) {
    final path = [...fullPath]..removeLast();
    return findSelected(path).children;
  }
}
