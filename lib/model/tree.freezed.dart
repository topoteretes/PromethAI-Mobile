// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tree.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tree _$TreeFromJson(Map<String, dynamic> json) {
  return _Tree.fromJson(json);
}

/// @nodoc
mixin _$Tree {
  NameAmount get goal => throw _privateConstructorUsedError;
  List<Tree> get children => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TreeCopyWith<Tree> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TreeCopyWith<$Res> {
  factory $TreeCopyWith(Tree value, $Res Function(Tree) then) =
      _$TreeCopyWithImpl<$Res, Tree>;
  @useResult
  $Res call({NameAmount goal, List<Tree> children});

  $NameAmountCopyWith<$Res> get goal;
}

/// @nodoc
class _$TreeCopyWithImpl<$Res, $Val extends Tree>
    implements $TreeCopyWith<$Res> {
  _$TreeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = null,
    Object? children = null,
  }) {
    return _then(_value.copyWith(
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as NameAmount,
      children: null == children
          ? _value.children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Tree>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NameAmountCopyWith<$Res> get goal {
    return $NameAmountCopyWith<$Res>(_value.goal, (value) {
      return _then(_value.copyWith(goal: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TreeCopyWith<$Res> implements $TreeCopyWith<$Res> {
  factory _$$_TreeCopyWith(_$_Tree value, $Res Function(_$_Tree) then) =
      __$$_TreeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NameAmount goal, List<Tree> children});

  @override
  $NameAmountCopyWith<$Res> get goal;
}

/// @nodoc
class __$$_TreeCopyWithImpl<$Res> extends _$TreeCopyWithImpl<$Res, _$_Tree>
    implements _$$_TreeCopyWith<$Res> {
  __$$_TreeCopyWithImpl(_$_Tree _value, $Res Function(_$_Tree) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goal = null,
    Object? children = null,
  }) {
    return _then(_$_Tree(
      goal: null == goal
          ? _value.goal
          : goal // ignore: cast_nullable_to_non_nullable
              as NameAmount,
      children: null == children
          ? _value._children
          : children // ignore: cast_nullable_to_non_nullable
              as List<Tree>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tree implements _Tree {
  const _$_Tree({required this.goal, required final List<Tree> children})
      : _children = children;

  factory _$_Tree.fromJson(Map<String, dynamic> json) => _$$_TreeFromJson(json);

  @override
  final NameAmount goal;
  final List<Tree> _children;
  @override
  List<Tree> get children {
    if (_children is EqualUnmodifiableListView) return _children;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_children);
  }

  @override
  String toString() {
    return 'Tree(goal: $goal, children: $children)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tree &&
            (identical(other.goal, goal) || other.goal == goal) &&
            const DeepCollectionEquality().equals(other._children, _children));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, goal, const DeepCollectionEquality().hash(_children));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TreeCopyWith<_$_Tree> get copyWith =>
      __$$_TreeCopyWithImpl<_$_Tree>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TreeToJson(
      this,
    );
  }
}

abstract class _Tree implements Tree {
  const factory _Tree(
      {required final NameAmount goal,
      required final List<Tree> children}) = _$_Tree;

  factory _Tree.fromJson(Map<String, dynamic> json) = _$_Tree.fromJson;

  @override
  NameAmount get goal;
  @override
  List<Tree> get children;
  @override
  @JsonKey(ignore: true)
  _$$_TreeCopyWith<_$_Tree> get copyWith => throw _privateConstructorUsedError;
}
