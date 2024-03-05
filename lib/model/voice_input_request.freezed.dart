// coverage:ignore-file
// ignore_for_file: non_constant_identifier_names

// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_input_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VoiceInputRequest _$VoiceInputRequestFromJson(Map<String, dynamic> json) {
  return _VoiceInputRequest.fromJson(json);
}

/// @nodoc
mixin _$VoiceInputRequest {
  String get query => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoiceInputRequestCopyWith<VoiceInputRequest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoiceInputRequestCopyWith<$Res> {
  factory $VoiceInputRequestCopyWith(VoiceInputRequest value, $Res Function(VoiceInputRequest) then) =
      _$VoiceInputRequestCopyWithImpl<$Res, VoiceInputRequest>;
  @useResult
  $Res call(
      {String query,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: "model_speed") String modelSpeed});
}

/// @nodoc
class _$VoiceInputRequestCopyWithImpl<$Res, $Val extends VoiceInputRequest> implements $VoiceInputRequestCopyWith<$Res> {
  _$VoiceInputRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? modelSpeed = null,
  }) {
    return _then(_value.copyWith(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      modelSpeed: null == modelSpeed
          ? _value.modelSpeed
          : modelSpeed // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VoiceInputRequestCopyWith<$Res> implements $VoiceInputRequestCopyWith<$Res> {
  factory _$$_VoiceInputRequestCopyWith(_$_VoiceInputRequest value, $Res Function(_$_VoiceInputRequest) then) =
      __$$_VoiceInputRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String query,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: "model_speed") String modelSpeed});
}

/// @nodoc
class __$$_VoiceInputRequestCopyWithImpl<$Res> extends _$VoiceInputRequestCopyWithImpl<$Res, _$_VoiceInputRequest>
    implements _$$_VoiceInputRequestCopyWith<$Res> {
  __$$_VoiceInputRequestCopyWithImpl(_$_VoiceInputRequest _value, $Res Function(_$_VoiceInputRequest) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? modelSpeed = null,
  }) {
    return _then(_$_VoiceInputRequest(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      modelSpeed: null == modelSpeed
          ? _value.modelSpeed
          : modelSpeed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_VoiceInputRequest implements _VoiceInputRequest {
  const _$_VoiceInputRequest(
      {required this.query,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: "model_speed") required this.modelSpeed});

  factory _$_VoiceInputRequest.fromJson(Map<String, dynamic> json) => _$$_VoiceInputRequestFromJson(json);

  @override
  final String query;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'session_id')
  final String sessionId;
  @override
  @JsonKey(name: "model_speed")
  final String modelSpeed;

  @override
  String toString() {
    return 'VoiceInputRequest(query: $query, userId: $userId, sessionId: $sessionId, modelSpeed: $modelSpeed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VoiceInputRequest &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) || other.sessionId == sessionId) &&
            (identical(other.modelSpeed, modelSpeed) || other.modelSpeed == modelSpeed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, query, userId, sessionId, modelSpeed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VoiceInputRequestCopyWith<_$_VoiceInputRequest> get copyWith =>
      __$$_VoiceInputRequestCopyWithImpl<_$_VoiceInputRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VoiceInputRequestToJson(
      this,
    );
  }
}

abstract class _VoiceInputRequest implements VoiceInputRequest {
  const factory _VoiceInputRequest(
      {required final String query,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'session_id') required final String sessionId,
      @JsonKey(name: "model_speed") required final String modelSpeed}) = _$_VoiceInputRequest;

  factory _VoiceInputRequest.fromJson(Map<String, dynamic> json) = _$_VoiceInputRequest.fromJson;

  @override
  String get query;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'session_id')
  String get sessionId;
  @override
  @JsonKey(name: "model_speed")
  String get modelSpeed;
  @override
  @JsonKey(ignore: true)
  _$$_VoiceInputRequestCopyWith<_$_VoiceInputRequest> get copyWith => throw _privateConstructorUsedError;
}
