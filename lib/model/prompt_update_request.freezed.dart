// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_update_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromptUpdateRequest _$PromptUpdateRequestFromJson(Map<String, dynamic> json) {
  return _PromptUpdateRequest.fromJson(json);
}

/// @nodoc
mixin _$PromptUpdateRequest {
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptUpdateRequestCopyWith<PromptUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptUpdateRequestCopyWith<$Res> {
  factory $PromptUpdateRequestCopyWith(
          PromptUpdateRequest value, $Res Function(PromptUpdateRequest) then) =
      _$PromptUpdateRequestCopyWithImpl<$Res, PromptUpdateRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      String category,
      String from,
      String to});
}

/// @nodoc
class _$PromptUpdateRequestCopyWithImpl<$Res, $Val extends PromptUpdateRequest>
    implements $PromptUpdateRequestCopyWith<$Res> {
  _$PromptUpdateRequestCopyWithImpl(this._value, this._then);

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
    Object? category = null,
    Object? from = null,
    Object? to = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromptUpdateRequestCopyWith<$Res>
    implements $PromptUpdateRequestCopyWith<$Res> {
  factory _$$_PromptUpdateRequestCopyWith(_$_PromptUpdateRequest value,
          $Res Function(_$_PromptUpdateRequest) then) =
      __$$_PromptUpdateRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      String category,
      String from,
      String to});
}

/// @nodoc
class __$$_PromptUpdateRequestCopyWithImpl<$Res>
    extends _$PromptUpdateRequestCopyWithImpl<$Res, _$_PromptUpdateRequest>
    implements _$$_PromptUpdateRequestCopyWith<$Res> {
  __$$_PromptUpdateRequestCopyWithImpl(_$_PromptUpdateRequest _value,
      $Res Function(_$_PromptUpdateRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelSpeed = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? category = null,
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$_PromptUpdateRequest(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromptUpdateRequest implements _PromptUpdateRequest {
  const _$_PromptUpdateRequest(
      {@JsonKey(name: "model_speed") required this.modelSpeed,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId,
      required this.category,
      required this.from,
      required this.to});

  factory _$_PromptUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PromptUpdateRequestFromJson(json);

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
  final String category;
  @override
  final String from;
  @override
  final String to;

  @override
  String toString() {
    return 'PromptUpdateRequest(modelSpeed: $modelSpeed, userId: $userId, sessionId: $sessionId, category: $category, from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromptUpdateRequest &&
            (identical(other.modelSpeed, modelSpeed) ||
                other.modelSpeed == modelSpeed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, modelSpeed, userId, sessionId, category, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromptUpdateRequestCopyWith<_$_PromptUpdateRequest> get copyWith =>
      __$$_PromptUpdateRequestCopyWithImpl<_$_PromptUpdateRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromptUpdateRequestToJson(
      this,
    );
  }
}

abstract class _PromptUpdateRequest implements PromptUpdateRequest {
  const factory _PromptUpdateRequest(
      {@JsonKey(name: "model_speed") required final String modelSpeed,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'session_id') required final String sessionId,
      required final String category,
      required final String from,
      required final String to}) = _$_PromptUpdateRequest;

  factory _PromptUpdateRequest.fromJson(Map<String, dynamic> json) =
      _$_PromptUpdateRequest.fromJson;

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
  String get category;
  @override
  String get from;
  @override
  String get to;
  @override
  @JsonKey(ignore: true)
  _$$_PromptUpdateRequestCopyWith<_$_PromptUpdateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
