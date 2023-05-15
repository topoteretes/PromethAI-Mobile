// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantRequest _$RestaurantRequestFromJson(Map<String, dynamic> json) {
  return _RestaurantRequest.fromJson(json);
}

/// @nodoc
mixin _$RestaurantRequest {
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  List<NameAmount> get factors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantRequestCopyWith<RestaurantRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantRequestCopyWith<$Res> {
  factory $RestaurantRequestCopyWith(
          RestaurantRequest value, $Res Function(RestaurantRequest) then) =
      _$RestaurantRequestCopyWithImpl<$Res, RestaurantRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      List<NameAmount> factors});
}

/// @nodoc
class _$RestaurantRequestCopyWithImpl<$Res, $Val extends RestaurantRequest>
    implements $RestaurantRequestCopyWith<$Res> {
  _$RestaurantRequestCopyWithImpl(this._value, this._then);

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
    Object? factors = null,
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
      factors: null == factors
          ? _value.factors
          : factors // ignore: cast_nullable_to_non_nullable
              as List<NameAmount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantRequestCopyWith<$Res>
    implements $RestaurantRequestCopyWith<$Res> {
  factory _$$_RestaurantRequestCopyWith(_$_RestaurantRequest value,
          $Res Function(_$_RestaurantRequest) then) =
      __$$_RestaurantRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      List<NameAmount> factors});
}

/// @nodoc
class __$$_RestaurantRequestCopyWithImpl<$Res>
    extends _$RestaurantRequestCopyWithImpl<$Res, _$_RestaurantRequest>
    implements _$$_RestaurantRequestCopyWith<$Res> {
  __$$_RestaurantRequestCopyWithImpl(
      _$_RestaurantRequest _value, $Res Function(_$_RestaurantRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelSpeed = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? factors = null,
  }) {
    return _then(_$_RestaurantRequest(
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
      factors: null == factors
          ? _value._factors
          : factors // ignore: cast_nullable_to_non_nullable
              as List<NameAmount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantRequest implements _RestaurantRequest {
  const _$_RestaurantRequest(
      {@JsonKey(name: "model_speed") required this.modelSpeed,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId,
      required final List<NameAmount> factors})
      : _factors = factors;

  factory _$_RestaurantRequest.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantRequestFromJson(json);

  @override
  @JsonKey(name: "model_speed")
  final String modelSpeed;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'session_id')
  final String sessionId;
  final List<NameAmount> _factors;
  @override
  List<NameAmount> get factors {
    if (_factors is EqualUnmodifiableListView) return _factors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_factors);
  }

  @override
  String toString() {
    return 'RestaurantRequest(modelSpeed: $modelSpeed, userId: $userId, sessionId: $sessionId, factors: $factors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantRequest &&
            (identical(other.modelSpeed, modelSpeed) ||
                other.modelSpeed == modelSpeed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            const DeepCollectionEquality().equals(other._factors, _factors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, modelSpeed, userId, sessionId,
      const DeepCollectionEquality().hash(_factors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantRequestCopyWith<_$_RestaurantRequest> get copyWith =>
      __$$_RestaurantRequestCopyWithImpl<_$_RestaurantRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantRequestToJson(
      this,
    );
  }
}

abstract class _RestaurantRequest implements RestaurantRequest {
  const factory _RestaurantRequest(
      {@JsonKey(name: "model_speed") required final String modelSpeed,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'session_id') required final String sessionId,
      required final List<NameAmount> factors}) = _$_RestaurantRequest;

  factory _RestaurantRequest.fromJson(Map<String, dynamic> json) =
      _$_RestaurantRequest.fromJson;

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
  List<NameAmount> get factors;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantRequestCopyWith<_$_RestaurantRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
