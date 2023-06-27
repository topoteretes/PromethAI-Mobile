// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_category_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromptCategoryRequest _$PromptCategoryRequestFromJson(
    Map<String, dynamic> json) {
  return _PromptCategoryRequest.fromJson(json);
}

/// @nodoc
mixin _$PromptCategoryRequest {
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'prompt_struct')
  String get promptStruct => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptCategoryRequestCopyWith<PromptCategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptCategoryRequestCopyWith<$Res> {
  factory $PromptCategoryRequestCopyWith(PromptCategoryRequest value,
          $Res Function(PromptCategoryRequest) then) =
      _$PromptCategoryRequestCopyWithImpl<$Res, PromptCategoryRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: 'prompt_struct') String promptStruct});
}

/// @nodoc
class _$PromptCategoryRequestCopyWithImpl<$Res,
        $Val extends PromptCategoryRequest>
    implements $PromptCategoryRequestCopyWith<$Res> {
  _$PromptCategoryRequestCopyWithImpl(this._value, this._then);

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
    Object? promptStruct = null,
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
      promptStruct: null == promptStruct
          ? _value.promptStruct
          : promptStruct // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromptCategoryRequestCopyWith<$Res>
    implements $PromptCategoryRequestCopyWith<$Res> {
  factory _$$_PromptCategoryRequestCopyWith(_$_PromptCategoryRequest value,
          $Res Function(_$_PromptCategoryRequest) then) =
      __$$_PromptCategoryRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      @JsonKey(name: 'prompt_struct') String promptStruct});
}

/// @nodoc
class __$$_PromptCategoryRequestCopyWithImpl<$Res>
    extends _$PromptCategoryRequestCopyWithImpl<$Res, _$_PromptCategoryRequest>
    implements _$$_PromptCategoryRequestCopyWith<$Res> {
  __$$_PromptCategoryRequestCopyWithImpl(_$_PromptCategoryRequest _value,
      $Res Function(_$_PromptCategoryRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelSpeed = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? promptStruct = null,
  }) {
    return _then(_$_PromptCategoryRequest(
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
      promptStruct: null == promptStruct
          ? _value.promptStruct
          : promptStruct // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromptCategoryRequest implements _PromptCategoryRequest {
  const _$_PromptCategoryRequest(
      {@JsonKey(name: "model_speed") required this.modelSpeed,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'prompt_struct') required this.promptStruct});

  factory _$_PromptCategoryRequest.fromJson(Map<String, dynamic> json) =>
      _$$_PromptCategoryRequestFromJson(json);

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
  @JsonKey(name: 'prompt_struct')
  final String promptStruct;

  @override
  String toString() {
    return 'PromptCategoryRequest(modelSpeed: $modelSpeed, userId: $userId, sessionId: $sessionId, promptStruct: $promptStruct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromptCategoryRequest &&
            (identical(other.modelSpeed, modelSpeed) ||
                other.modelSpeed == modelSpeed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.promptStruct, promptStruct) ||
                other.promptStruct == promptStruct));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, modelSpeed, userId, sessionId, promptStruct);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromptCategoryRequestCopyWith<_$_PromptCategoryRequest> get copyWith =>
      __$$_PromptCategoryRequestCopyWithImpl<_$_PromptCategoryRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromptCategoryRequestToJson(
      this,
    );
  }
}

abstract class _PromptCategoryRequest implements PromptCategoryRequest {
  const factory _PromptCategoryRequest(
          {@JsonKey(name: "model_speed") required final String modelSpeed,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'session_id') required final String sessionId,
          @JsonKey(name: 'prompt_struct') required final String promptStruct}) =
      _$_PromptCategoryRequest;

  factory _PromptCategoryRequest.fromJson(Map<String, dynamic> json) =
      _$_PromptCategoryRequest.fromJson;

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
  @JsonKey(name: 'prompt_struct')
  String get promptStruct;
  @override
  @JsonKey(ignore: true)
  _$$_PromptCategoryRequestCopyWith<_$_PromptCategoryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
