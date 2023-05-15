// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'journey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Journey _$JourneyFromJson(Map<String, dynamic> json) {
  return _Journey.fromJson(json);
}

/// @nodoc
mixin _$Journey {
  Tree get tree => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  int get modified => throw _privateConstructorUsedError;
  List<String> get path => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JourneyCopyWith<Journey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JourneyCopyWith<$Res> {
  factory $JourneyCopyWith(Journey value, $Res Function(Journey) then) =
      _$JourneyCopyWithImpl<$Res, Journey>;
  @useResult
  $Res call({Tree tree, int created, int modified, List<String> path});

  $TreeCopyWith<$Res> get tree;
}

/// @nodoc
class _$JourneyCopyWithImpl<$Res, $Val extends Journey>
    implements $JourneyCopyWith<$Res> {
  _$JourneyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tree = null,
    Object? created = null,
    Object? modified = null,
    Object? path = null,
  }) {
    return _then(_value.copyWith(
      tree: null == tree
          ? _value.tree
          : tree // ignore: cast_nullable_to_non_nullable
              as Tree,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TreeCopyWith<$Res> get tree {
    return $TreeCopyWith<$Res>(_value.tree, (value) {
      return _then(_value.copyWith(tree: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JourneyCopyWith<$Res> implements $JourneyCopyWith<$Res> {
  factory _$$_JourneyCopyWith(
          _$_Journey value, $Res Function(_$_Journey) then) =
      __$$_JourneyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tree tree, int created, int modified, List<String> path});

  @override
  $TreeCopyWith<$Res> get tree;
}

/// @nodoc
class __$$_JourneyCopyWithImpl<$Res>
    extends _$JourneyCopyWithImpl<$Res, _$_Journey>
    implements _$$_JourneyCopyWith<$Res> {
  __$$_JourneyCopyWithImpl(_$_Journey _value, $Res Function(_$_Journey) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tree = null,
    Object? created = null,
    Object? modified = null,
    Object? path = null,
  }) {
    return _then(_$_Journey(
      tree: null == tree
          ? _value.tree
          : tree // ignore: cast_nullable_to_non_nullable
              as Tree,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      modified: null == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as int,
      path: null == path
          ? _value._path
          : path // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Journey implements _Journey {
  const _$_Journey(
      {required this.tree,
      required this.created,
      required this.modified,
      required final List<String> path})
      : _path = path;

  factory _$_Journey.fromJson(Map<String, dynamic> json) =>
      _$$_JourneyFromJson(json);

  @override
  final Tree tree;
  @override
  final int created;
  @override
  final int modified;
  final List<String> _path;
  @override
  List<String> get path {
    if (_path is EqualUnmodifiableListView) return _path;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_path);
  }

  @override
  String toString() {
    return 'Journey(tree: $tree, created: $created, modified: $modified, path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Journey &&
            (identical(other.tree, tree) || other.tree == tree) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            const DeepCollectionEquality().equals(other._path, _path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tree, created, modified,
      const DeepCollectionEquality().hash(_path));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JourneyCopyWith<_$_Journey> get copyWith =>
      __$$_JourneyCopyWithImpl<_$_Journey>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JourneyToJson(
      this,
    );
  }
}

abstract class _Journey implements Journey {
  const factory _Journey(
      {required final Tree tree,
      required final int created,
      required final int modified,
      required final List<String> path}) = _$_Journey;

  factory _Journey.fromJson(Map<String, dynamic> json) = _$_Journey.fromJson;

  @override
  Tree get tree;
  @override
  int get created;
  @override
  int get modified;
  @override
  List<String> get path;
  @override
  @JsonKey(ignore: true)
  _$$_JourneyCopyWith<_$_Journey> get copyWith =>
      throw _privateConstructorUsedError;
}
