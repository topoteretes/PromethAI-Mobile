// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryRequest _$DeliveryRequestFromJson(Map<String, dynamic> json) {
  return _DeliveryRequest.fromJson(json);
}

/// @nodoc
mixin _$DeliveryRequest {
  @JsonKey(name: "model_speed")
  String get modelSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  String get sessionId => throw _privateConstructorUsedError;
  String get zipcode => throw _privateConstructorUsedError;
  List<NameAmount> get factors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryRequestCopyWith<DeliveryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryRequestCopyWith<$Res> {
  factory $DeliveryRequestCopyWith(
          DeliveryRequest value, $Res Function(DeliveryRequest) then) =
      _$DeliveryRequestCopyWithImpl<$Res, DeliveryRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      String zipcode,
      List<NameAmount> factors});
}

/// @nodoc
class _$DeliveryRequestCopyWithImpl<$Res, $Val extends DeliveryRequest>
    implements $DeliveryRequestCopyWith<$Res> {
  _$DeliveryRequestCopyWithImpl(this._value, this._then);

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
    Object? zipcode = null,
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
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
              as String,
      factors: null == factors
          ? _value.factors
          : factors // ignore: cast_nullable_to_non_nullable
              as List<NameAmount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryRequestCopyWith<$Res>
    implements $DeliveryRequestCopyWith<$Res> {
  factory _$$_DeliveryRequestCopyWith(
          _$_DeliveryRequest value, $Res Function(_$_DeliveryRequest) then) =
      __$$_DeliveryRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "model_speed") String modelSpeed,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'session_id') String sessionId,
      String zipcode,
      List<NameAmount> factors});
}

/// @nodoc
class __$$_DeliveryRequestCopyWithImpl<$Res>
    extends _$DeliveryRequestCopyWithImpl<$Res, _$_DeliveryRequest>
    implements _$$_DeliveryRequestCopyWith<$Res> {
  __$$_DeliveryRequestCopyWithImpl(
      _$_DeliveryRequest _value, $Res Function(_$_DeliveryRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? modelSpeed = null,
    Object? userId = null,
    Object? sessionId = null,
    Object? zipcode = null,
    Object? factors = null,
  }) {
    return _then(_$_DeliveryRequest(
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
      zipcode: null == zipcode
          ? _value.zipcode
          : zipcode // ignore: cast_nullable_to_non_nullable
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
class _$_DeliveryRequest implements _DeliveryRequest {
  const _$_DeliveryRequest(
      {@JsonKey(name: "model_speed") required this.modelSpeed,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'session_id') required this.sessionId,
      required this.zipcode,
      required final List<NameAmount> factors})
      : _factors = factors;

  factory _$_DeliveryRequest.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryRequestFromJson(json);

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
  final String zipcode;
  final List<NameAmount> _factors;
  @override
  List<NameAmount> get factors {
    if (_factors is EqualUnmodifiableListView) return _factors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_factors);
  }

  @override
  String toString() {
    return 'DeliveryRequest(modelSpeed: $modelSpeed, userId: $userId, sessionId: $sessionId, zipcode: $zipcode, factors: $factors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryRequest &&
            (identical(other.modelSpeed, modelSpeed) ||
                other.modelSpeed == modelSpeed) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.sessionId, sessionId) ||
                other.sessionId == sessionId) &&
            (identical(other.zipcode, zipcode) || other.zipcode == zipcode) &&
            const DeepCollectionEquality().equals(other._factors, _factors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, modelSpeed, userId, sessionId,
      zipcode, const DeepCollectionEquality().hash(_factors));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryRequestCopyWith<_$_DeliveryRequest> get copyWith =>
      __$$_DeliveryRequestCopyWithImpl<_$_DeliveryRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryRequestToJson(
      this,
    );
  }
}

abstract class _DeliveryRequest implements DeliveryRequest {
  const factory _DeliveryRequest(
      {@JsonKey(name: "model_speed") required final String modelSpeed,
      @JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'session_id') required final String sessionId,
      required final String zipcode,
      required final List<NameAmount> factors}) = _$_DeliveryRequest;

  factory _DeliveryRequest.fromJson(Map<String, dynamic> json) =
      _$_DeliveryRequest.fromJson;

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
  String get zipcode;
  @override
  List<NameAmount> get factors;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryRequestCopyWith<_$_DeliveryRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
