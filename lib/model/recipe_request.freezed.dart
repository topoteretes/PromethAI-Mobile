// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeRequest _$RecipeRequestFromJson(Map<String, dynamic> json) {
  return _RecipeRequest.fromJson(json);
}

/// @nodoc
mixin _$RecipeRequest {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeRequestCopyWith<RecipeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeRequestCopyWith<$Res> {
  factory $RecipeRequestCopyWith(
          RecipeRequest value, $Res Function(RecipeRequest) then) =
      _$RecipeRequestCopyWithImpl<$Res, RecipeRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: "model_speed") String modelSpeed,
      String prompt});
}

/// @nodoc
class _$RecipeRequestCopyWithImpl<$Res, $Val extends RecipeRequest>
    implements $RecipeRequestCopyWith<$Res> {
  _$RecipeRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sessionId = null,
    Object? modelSpeed = null,
    Object? prompt = null,
  }) {
    return _then(_value.copyWith(
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
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeRequestCopyWith<$Res>
    implements $RecipeRequestCopyWith<$Res> {
  factory _$$_RecipeRequestCopyWith(
          _$_RecipeRequest value, $Res Function(_$_RecipeRequest) then) =
      __$$_RecipeRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: "model_speed") String modelSpeed,
      String prompt});
}

/// @nodoc
class __$$_RecipeRequestCopyWithImpl<$Res>
    extends _$RecipeRequestCopyWithImpl<$Res, _$_RecipeRequest>
    implements _$$_RecipeRequestCopyWith<$Res> {
  __$$_RecipeRequestCopyWithImpl(
      _$_RecipeRequest _value, $Res Function(_$_RecipeRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? sessionId = null,
    Object? modelSpeed = null,
    Object? prompt = null,
  }) {
    return _then(_$_RecipeRequest(
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
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeRequest implements _RecipeRequest {
  const _$_RecipeRequest(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: "model_speed") required this.modelSpeed,
      required this.prompt});

  factory _$_RecipeRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeRequestFromJson(json);

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
  final String prompt;

  @override
  String toString() {
    return 'RecipeRequest(userId: $userId, sessionId: $sessionId, modelSpeed: $modelSpeed, prompt: $prompt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeRequest &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.modelSpeed, modelSpeed) ||
                other.modelSpeed == modelSpeed) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, sessionId, modelSpeed, prompt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeRequestCopyWith<_$_RecipeRequest> get copyWith =>
      __$$_RecipeRequestCopyWithImpl<_$_RecipeRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeRequestToJson(
      this,
    );
  }
}

abstract class _RecipeRequest implements RecipeRequest {
  const factory _RecipeRequest(
      {@JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'session_id') required final String sessionId,
      @JsonKey(name: "model_speed") required final String modelSpeed,
      required final String prompt}) = _$_RecipeRequest;

  factory _RecipeRequest.fromJson(Map<String, dynamic> json) =
      _$_RecipeRequest.fromJson;

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
  String get prompt;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeRequestCopyWith<_$_RecipeRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
