// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_choose_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromptChooseRequest _$PromptChooseRequestFromJson(Map<String, dynamic> json) {
  return _PromptChooseRequest.fromJson(json);
}

/// @nodoc
mixin _$PromptChooseRequest {
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptChooseRequestCopyWith<PromptChooseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptChooseRequestCopyWith<$Res> {
  factory $PromptChooseRequestCopyWith(
          PromptChooseRequest value, $Res Function(PromptChooseRequest) then) =
      _$PromptChooseRequestCopyWithImpl<$Res, PromptChooseRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      String prompt});
}

/// @nodoc
class _$PromptChooseRequestCopyWithImpl<$Res, $Val extends PromptChooseRequest>
    implements $PromptChooseRequestCopyWith<$Res> {
  _$PromptChooseRequestCopyWithImpl(this._value, this._then);

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
    Object? prompt = null,
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
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromptChooseRequestCopyWith<$Res>
    implements $PromptChooseRequestCopyWith<$Res> {
  factory _$$_PromptChooseRequestCopyWith(_$_PromptChooseRequest value,
          $Res Function(_$_PromptChooseRequest) then) =
      __$$_PromptChooseRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      String prompt});
}

/// @nodoc
class __$$_PromptChooseRequestCopyWithImpl<$Res>
    extends _$PromptChooseRequestCopyWithImpl<$Res, _$_PromptChooseRequest>
    implements _$$_PromptChooseRequestCopyWith<$Res> {
  __$$_PromptChooseRequestCopyWithImpl(_$_PromptChooseRequest _value,
      $Res Function(_$_PromptChooseRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelSpeed = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? prompt = null,
  }) {
    return _then(_$_PromptChooseRequest(
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
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromptChooseRequest implements _PromptChooseRequest {
  const _$_PromptChooseRequest(
      {@JsonKey(name: "model_speed") required this.modelSpeed,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId,
      required this.prompt});

  factory _$_PromptChooseRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PromptChooseRequestFromJson(json);

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
  final String prompt;

  @override
  String toString() {
    return 'PromptChooseRequest(modelSpeed: $modelSpeed, userId: $userId, sessionId: $sessionId, prompt: $prompt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromptChooseRequest &&
            (identical(other.modelSpeed, modelSpeed) ||
                other.modelSpeed == modelSpeed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, modelSpeed, userId, sessionId, prompt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromptChooseRequestCopyWith<_$_PromptChooseRequest> get copyWith =>
      __$$_PromptChooseRequestCopyWithImpl<_$_PromptChooseRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromptChooseRequestToJson(
      this,
    );
  }
}

abstract class _PromptChooseRequest implements PromptChooseRequest {
  const factory _PromptChooseRequest(
      {@JsonKey(name: "model_speed") required final String modelSpeed,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'session_id') required final String sessionId,
      required final String prompt}) = _$_PromptChooseRequest;

  factory _PromptChooseRequest.fromJson(Map<String, dynamic> json) =
      _$_PromptChooseRequest.fromJson;

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
  String get prompt;
  @override
  @JsonKey(ignore: true)
  _$$_PromptChooseRequestCopyWith<_$_PromptChooseRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
