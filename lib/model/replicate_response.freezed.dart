// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replicate_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReplicateResponse _$ReplicateResponseFromJson(Map<String, dynamic> json) {
  return _ReplicateResponse.fromJson(json);
}

/// @nodoc
mixin _$ReplicateResponse {
  String get id => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  PromptInput get input => throw _privateConstructorUsedError;
  String get logs => throw _privateConstructorUsedError;
  List<String>? get error => throw _privateConstructorUsedError;
  List<String>? get output => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "completed_at")
  String? get completedAt => throw _privateConstructorUsedError;
  ReplicateUrls get urls => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReplicateResponseCopyWith<ReplicateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplicateResponseCopyWith<$Res> {
  factory $ReplicateResponseCopyWith(
          ReplicateResponse value, $Res Function(ReplicateResponse) then) =
      _$ReplicateResponseCopyWithImpl<$Res, ReplicateResponse>;
  @useResult
  $Res call(
      {String id,
      String version,
      PromptInput input,
      String logs,
      List<String>? error,
      List<String>? output,
      String status,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "completed_at") String? completedAt,
      ReplicateUrls urls});

  $PromptInputCopyWith<$Res> get input;
  $ReplicateUrlsCopyWith<$Res> get urls;
}

/// @nodoc
class _$ReplicateResponseCopyWithImpl<$Res, $Val extends ReplicateResponse>
    implements $ReplicateResponseCopyWith<$Res> {
  _$ReplicateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? version = null,
    Object? input = null,
    Object? logs = null,
    Object? error = freezed,
    Object? output = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? urls = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as PromptInput,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      output: freezed == output
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as ReplicateUrls,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PromptInputCopyWith<$Res> get input {
    return $PromptInputCopyWith<$Res>(_value.input, (value) {
      return _then(_value.copyWith(input: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReplicateUrlsCopyWith<$Res> get urls {
    return $ReplicateUrlsCopyWith<$Res>(_value.urls, (value) {
      return _then(_value.copyWith(urls: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReplicateResponseCopyWith<$Res>
    implements $ReplicateResponseCopyWith<$Res> {
  factory _$$_ReplicateResponseCopyWith(_$_ReplicateResponse value,
          $Res Function(_$_ReplicateResponse) then) =
      __$$_ReplicateResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String version,
      PromptInput input,
      String logs,
      List<String>? error,
      List<String>? output,
      String status,
      @JsonKey(name: "created_at") String createdAt,
      @JsonKey(name: "completed_at") String? completedAt,
      ReplicateUrls urls});

  @override
  $PromptInputCopyWith<$Res> get input;
  @override
  $ReplicateUrlsCopyWith<$Res> get urls;
}

/// @nodoc
class __$$_ReplicateResponseCopyWithImpl<$Res>
    extends _$ReplicateResponseCopyWithImpl<$Res, _$_ReplicateResponse>
    implements _$$_ReplicateResponseCopyWith<$Res> {
  __$$_ReplicateResponseCopyWithImpl(
      _$_ReplicateResponse _value, $Res Function(_$_ReplicateResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? version = null,
    Object? input = null,
    Object? logs = null,
    Object? error = freezed,
    Object? output = freezed,
    Object? status = null,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? urls = null,
  }) {
    return _then(_$_ReplicateResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      input: null == input
          ? _value.input
          : input // ignore: cast_nullable_to_non_nullable
              as PromptInput,
      logs: null == logs
          ? _value.logs
          : logs // ignore: cast_nullable_to_non_nullable
              as String,
      error: freezed == error
          ? _value._error
          : error // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      output: freezed == output
          ? _value._output
          : output // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as ReplicateUrls,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReplicateResponse implements _ReplicateResponse {
  const _$_ReplicateResponse(
      {required this.id,
      required this.version,
      required this.input,
      required this.logs,
      final List<String>? error,
      final List<String>? output,
      required this.status,
      @JsonKey(name: "created_at") required this.createdAt,
      @JsonKey(name: "completed_at") this.completedAt,
      required this.urls})
      : _error = error,
        _output = output;

  factory _$_ReplicateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ReplicateResponseFromJson(json);

  @override
  final String id;
  @override
  final String version;
  @override
  final PromptInput input;
  @override
  final String logs;
  final List<String>? _error;
  @override
  List<String>? get error {
    final value = _error;
    if (value == null) return null;
    if (_error is EqualUnmodifiableListView) return _error;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _output;
  @override
  List<String>? get output {
    final value = _output;
    if (value == null) return null;
    if (_output is EqualUnmodifiableListView) return _output;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String status;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  @JsonKey(name: "completed_at")
  final String? completedAt;
  @override
  final ReplicateUrls urls;

  @override
  String toString() {
    return 'ReplicateResponse(id: $id, version: $version, input: $input, logs: $logs, error: $error, output: $output, status: $status, createdAt: $createdAt, completedAt: $completedAt, urls: $urls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReplicateResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.input, input) || other.input == input) &&
            (identical(other.logs, logs) || other.logs == logs) &&
            const DeepCollectionEquality().equals(other._error, _error) &&
            const DeepCollectionEquality().equals(other._output, _output) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.urls, urls) || other.urls == urls));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      version,
      input,
      logs,
      const DeepCollectionEquality().hash(_error),
      const DeepCollectionEquality().hash(_output),
      status,
      createdAt,
      completedAt,
      urls);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReplicateResponseCopyWith<_$_ReplicateResponse> get copyWith =>
      __$$_ReplicateResponseCopyWithImpl<_$_ReplicateResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReplicateResponseToJson(
      this,
    );
  }
}

abstract class _ReplicateResponse implements ReplicateResponse {
  const factory _ReplicateResponse(
      {required final String id,
      required final String version,
      required final PromptInput input,
      required final String logs,
      final List<String>? error,
      final List<String>? output,
      required final String status,
      @JsonKey(name: "created_at") required final String createdAt,
      @JsonKey(name: "completed_at") final String? completedAt,
      required final ReplicateUrls urls}) = _$_ReplicateResponse;

  factory _ReplicateResponse.fromJson(Map<String, dynamic> json) =
      _$_ReplicateResponse.fromJson;

  @override
  String get id;
  @override
  String get version;
  @override
  PromptInput get input;
  @override
  String get logs;
  @override
  List<String>? get error;
  @override
  List<String>? get output;
  @override
  String get status;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  @JsonKey(name: "completed_at")
  String? get completedAt;
  @override
  ReplicateUrls get urls;
  @override
  @JsonKey(ignore: true)
  _$$_ReplicateResponseCopyWith<_$_ReplicateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
