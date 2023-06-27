// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replicate_urls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplicateUrls _$ReplicateUrlsFromJson(Map<String, dynamic> json) {
  return _ReplicateUrls.fromJson(json);
}

/// @nodoc
mixin _$ReplicateUrls {
  String get cancel => throw _privateConstructorUsedError;
  String get get => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplicateUrlsCopyWith<ReplicateUrls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplicateUrlsCopyWith<$Res> {
  factory $ReplicateUrlsCopyWith(
          ReplicateUrls value, $Res Function(ReplicateUrls) then) =
      _$ReplicateUrlsCopyWithImpl<$Res, ReplicateUrls>;
  @useResult
  $Res call({String cancel, String get});
}

/// @nodoc
class _$ReplicateUrlsCopyWithImpl<$Res, $Val extends ReplicateUrls>
    implements $ReplicateUrlsCopyWith<$Res> {
  _$ReplicateUrlsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancel = null,
    Object? get = null,
  }) {
    return _then(_value.copyWith(
      cancel: null == cancel
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as String,
      get: null == get
          ? _value.get
          : get // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReplicateUrlsCopyWith<$Res>
    implements $ReplicateUrlsCopyWith<$Res> {
  factory _$$_ReplicateUrlsCopyWith(
          _$_ReplicateUrls value, $Res Function(_$_ReplicateUrls) then) =
      __$$_ReplicateUrlsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String cancel, String get});
}

/// @nodoc
class __$$_ReplicateUrlsCopyWithImpl<$Res>
    extends _$ReplicateUrlsCopyWithImpl<$Res, _$_ReplicateUrls>
    implements _$$_ReplicateUrlsCopyWith<$Res> {
  __$$_ReplicateUrlsCopyWithImpl(
      _$_ReplicateUrls _value, $Res Function(_$_ReplicateUrls) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancel = null,
    Object? get = null,
  }) {
    return _then(_$_ReplicateUrls(
      cancel: null == cancel
          ? _value.cancel
          : cancel // ignore: cast_nullable_to_non_nullable
              as String,
      get: null == get
          ? _value.get
          : get // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReplicateUrls implements _ReplicateUrls {
  const _$_ReplicateUrls({required this.cancel, required this.get});

  factory _$_ReplicateUrls.fromJson(Map<String, dynamic> json) =>
      _$$_ReplicateUrlsFromJson(json);

  @override
  final String cancel;
  @override
  final String get;

  @override
  String toString() {
    return 'ReplicateUrls(cancel: $cancel, get: $get)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplicateUrls &&
            (identical(other.cancel, cancel) || other.cancel == cancel) &&
            (identical(other.get, get) || other.get == get));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cancel, get);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplicateUrlsCopyWith<_$_ReplicateUrls> get copyWith =>
      __$$_ReplicateUrlsCopyWithImpl<_$_ReplicateUrls>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplicateUrlsToJson(
      this,
    );
  }
}

abstract class _ReplicateUrls implements ReplicateUrls {
  const factory _ReplicateUrls(
      {required final String cancel,
      required final String get}) = _$_ReplicateUrls;

  factory _ReplicateUrls.fromJson(Map<String, dynamic> json) =
      _$_ReplicateUrls.fromJson;

  @override
  String get cancel;
  @override
  String get get;
  @override
  @JsonKey(ignore: true)
  _$$_ReplicateUrlsCopyWith<_$_ReplicateUrls> get copyWith =>
      throw _privateConstructorUsedError;
}
