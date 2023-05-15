// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_goal_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DietGoalRequest _$DietGoalRequestFromJson(Map<String, dynamic> json) {
  return _DietGoalRequest.fromJson(json);
}

/// @nodoc
mixin _$DietGoalRequest {
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DietGoalRequestCopyWith<DietGoalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietGoalRequestCopyWith<$Res> {
  factory $DietGoalRequestCopyWith(
          DietGoalRequest value, $Res Function(DietGoalRequest) then) =
      _$DietGoalRequestCopyWithImpl<$Res, DietGoalRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId});
}

/// @nodoc
class _$DietGoalRequestCopyWithImpl<$Res, $Val extends DietGoalRequest>
    implements $DietGoalRequestCopyWith<$Res> {
  _$DietGoalRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelSpeed = null,
    Object? userId = null,
    Object? sessionId = null,
  }) {
    return _then(_value.copyWith(
      modelSpeed: null == modelSpeed
          ? _value.modelSpeed
          : modelSpeed // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DietGoalRequestCopyWith<$Res>
    implements $DietGoalRequestCopyWith<$Res> {
  factory _$$_DietGoalRequestCopyWith(
          _$_DietGoalRequest value, $Res Function(_$_DietGoalRequest) then) =
      __$$_DietGoalRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId});
}

/// @nodoc
class __$$_DietGoalRequestCopyWithImpl<$Res>
    extends _$DietGoalRequestCopyWithImpl<$Res, _$_DietGoalRequest>
    implements _$$_DietGoalRequestCopyWith<$Res> {
  __$$_DietGoalRequestCopyWithImpl(
      _$_DietGoalRequest _value, $Res Function(_$_DietGoalRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelSpeed = null,
    Object? userId = null,
    Object? sessionId = null,
  }) {
    return _then(_$_DietGoalRequest(
      modelSpeed: null == modelSpeed
          ? _value.modelSpeed
          : modelSpeed // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      sessionId: null == sessionId
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DietGoalRequest implements _DietGoalRequest {
  const _$_DietGoalRequest(
      {@JsonKey(name: "model_speed") required this.modelSpeed,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId});

  factory _$_DietGoalRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DietGoalRequestFromJson(json);

  @override
  @JsonKey(name: "model_speed")
  final String modelSpeed;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'session_id')
  final String sessionId;

  @override
  String toString() {
    return 'DietGoalRequest(modelSpeed: $modelSpeed, userId: $userId, sessionId: $sessionId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DietGoalRequest &&
            (identical(other.modelSpeed, modelSpeed) ||
                other.modelSpeed == modelSpeed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, modelSpeed, userId, sessionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DietGoalRequestCopyWith<_$_DietGoalRequest> get copyWith =>
      __$$_DietGoalRequestCopyWithImpl<_$_DietGoalRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DietGoalRequestToJson(
      this,
    );
  }
}

abstract class _DietGoalRequest implements DietGoalRequest {
  const factory _DietGoalRequest(
          {@JsonKey(name: "model_speed") required final String modelSpeed,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'session_id') required final String sessionId}) =
      _$_DietGoalRequest;

  factory _DietGoalRequest.fromJson(Map<String, dynamic> json) =
      _$_DietGoalRequest.fromJson;

  @override
  @JsonKey(name: "model_speed")
  String get modelSpeed;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'session_id')
  String get sessionId;
  @override
  @JsonKey(ignore: true)
  _$$_DietGoalRequestCopyWith<_$_DietGoalRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
