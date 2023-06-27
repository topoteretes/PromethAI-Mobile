// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pexel_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PexelParams _$PexelParamsFromJson(Map<String, dynamic> json) {
  return _PexelParams.fromJson(json);
}

/// @nodoc
mixin _$PexelParams {
  String get query => throw _privateConstructorUsedError;
  String get size => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PexelParamsCopyWith<PexelParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PexelParamsCopyWith<$Res> {
  factory $PexelParamsCopyWith(
          PexelParams value, $Res Function(PexelParams) then) =
      _$PexelParamsCopyWithImpl<$Res, PexelParams>;
  @useResult
  $Res call({String query, String size});
}

/// @nodoc
class _$PexelParamsCopyWithImpl<$Res, $Val extends PexelParams>
    implements $PexelParamsCopyWith<$Res> {
  _$PexelParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? size = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PexelParamsCopyWith<$Res>
    implements $PexelParamsCopyWith<$Res> {
  factory _$$_PexelParamsCopyWith(
          _$_PexelParams value, $Res Function(_$_PexelParams) then) =
      __$$_PexelParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String query, String size});
}

/// @nodoc
class __$$_PexelParamsCopyWithImpl<$Res>
    extends _$PexelParamsCopyWithImpl<$Res, _$_PexelParams>
    implements _$$_PexelParamsCopyWith<$Res> {
  __$$_PexelParamsCopyWithImpl(
      _$_PexelParams _value, $Res Function(_$_PexelParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? size = null,
  }) {
    return _then(_$_PexelParams(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PexelParams implements _PexelParams {
  const _$_PexelParams({required this.query, required this.size});

  factory _$_PexelParams.fromJson(Map<String, dynamic> json) =>
      _$$_PexelParamsFromJson(json);

  @override
  final String query;
  @override
  final String size;

  @override
  String toString() {
    return 'PexelParams(query: $query, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PexelParams &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, query, size);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PexelParamsCopyWith<_$_PexelParams> get copyWith =>
      __$$_PexelParamsCopyWithImpl<_$_PexelParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PexelParamsToJson(
      this,
    );
  }
}

abstract class _PexelParams implements PexelParams {
  const factory _PexelParams(
      {required final String query,
      required final String size}) = _$_PexelParams;

  factory _PexelParams.fromJson(Map<String, dynamic> json) =
      _$_PexelParams.fromJson;

  @override
  String get query;
  @override
  String get size;
  @override
  @JsonKey(ignore: true)
  _$$_PexelParamsCopyWith<_$_PexelParams> get copyWith =>
      throw _privateConstructorUsedError;
}
