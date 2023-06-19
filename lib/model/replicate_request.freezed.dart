// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replicate_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplicateRequest _$ReplicateRequestFromJson(Map<String, dynamic> json) {
  return _ReplicateRequest.fromJson(json);
}

/// @nodoc
mixin _$ReplicateRequest {
  String get version => throw _privateConstructorUsedError;
  PromptInput get input => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplicateRequestCopyWith<ReplicateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplicateRequestCopyWith<$Res> {
  factory $ReplicateRequestCopyWith(
          ReplicateRequest value, $Res Function(ReplicateRequest) then) =
      _$ReplicateRequestCopyWithImpl<$Res, ReplicateRequest>;
  @useResult
  $Res call({String version, PromptInput input});

  $PromptInputCopyWith<$Res> get input;
}

/// @nodoc
class _$ReplicateRequestCopyWithImpl<$Res, $Val extends ReplicateRequest>
    implements $ReplicateRequestCopyWith<$Res> {
  _$ReplicateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? input = null,
  }) {
    return _then(_value.copyWith(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as PromptInput,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptInputCopyWith<$Res> get input {
    return $PromptInputCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReplicateRequestCopyWith<$Res>
    implements $ReplicateRequestCopyWith<$Res> {
  factory _$$_ReplicateRequestCopyWith(
          _$_ReplicateRequest value, $Res Function(_$_ReplicateRequest) then) =
      __$$_ReplicateRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String version, PromptInput input});

  @override
  $PromptInputCopyWith<$Res> get input;
}

/// @nodoc
class __$$_ReplicateRequestCopyWithImpl<$Res>
    extends _$ReplicateRequestCopyWithImpl<$Res, _$_ReplicateRequest>
    implements _$$_ReplicateRequestCopyWith<$Res> {
  __$$_ReplicateRequestCopyWithImpl(
      _$_ReplicateRequest _value, $Res Function(_$_ReplicateRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? version = null,
    Object? input = null,
  }) {
    return _then(_$_ReplicateRequest(
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as PromptInput,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReplicateRequest implements _ReplicateRequest {
  const _$_ReplicateRequest({required this.version, required this.input});

  factory _$_ReplicateRequest.fromJson(Map<String, dynamic> json) =>
      _$$_ReplicateRequestFromJson(json);

  @override
  final String version;
  @override
  final PromptInput input;

  @override
  String toString() {
    return 'ReplicateRequest(version: $version, input: $input)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplicateRequest &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.input, input) || other.input == input));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, version, input);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplicateRequestCopyWith<_$_ReplicateRequest> get copyWith =>
      __$$_ReplicateRequestCopyWithImpl<_$_ReplicateRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplicateRequestToJson(
      this,
    );
  }
}

abstract class _ReplicateRequest implements ReplicateRequest {
  const factory _ReplicateRequest(
      {required final String version,
      required final PromptInput input}) = _$_ReplicateRequest;

  factory _ReplicateRequest.fromJson(Map<String, dynamic> json) =
      _$_ReplicateRequest.fromJson;

  @override
  String get version;
  @override
  PromptInput get input;
  @override
  @JsonKey(ignore: true)
  _$$_ReplicateRequestCopyWith<_$_ReplicateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
