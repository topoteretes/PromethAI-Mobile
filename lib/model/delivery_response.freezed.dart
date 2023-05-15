// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryResponse _$DeliveryResponseFromJson(Map<String, dynamic> json) {
  return _DeliveryResponse.fromJson(json);
}

/// @nodoc
mixin _$DeliveryResponse {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryResponseCopyWith<DeliveryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryResponseCopyWith<$Res> {
  factory $DeliveryResponseCopyWith(
          DeliveryResponse value, $Res Function(DeliveryResponse) then) =
      _$DeliveryResponseCopyWithImpl<$Res, DeliveryResponse>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$DeliveryResponseCopyWithImpl<$Res, $Val extends DeliveryResponse>
    implements $DeliveryResponseCopyWith<$Res> {
  _$DeliveryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeliveryResponseCopyWith<$Res>
    implements $DeliveryResponseCopyWith<$Res> {
  factory _$$_DeliveryResponseCopyWith(
          _$_DeliveryResponse value, $Res Function(_$_DeliveryResponse) then) =
      __$$_DeliveryResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$_DeliveryResponseCopyWithImpl<$Res>
    extends _$DeliveryResponseCopyWithImpl<$Res, _$_DeliveryResponse>
    implements _$$_DeliveryResponseCopyWith<$Res> {
  __$$_DeliveryResponseCopyWithImpl(
      _$_DeliveryResponse _value, $Res Function(_$_DeliveryResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$_DeliveryResponse(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeliveryResponse implements _DeliveryResponse {
  const _$_DeliveryResponse({required this.url});

  factory _$_DeliveryResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DeliveryResponseFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'DeliveryResponse(url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeliveryResponse &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeliveryResponseCopyWith<_$_DeliveryResponse> get copyWith =>
      __$$_DeliveryResponseCopyWithImpl<_$_DeliveryResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeliveryResponseToJson(
      this,
    );
  }
}

abstract class _DeliveryResponse implements DeliveryResponse {
  const factory _DeliveryResponse({required final String url}) =
      _$_DeliveryResponse;

  factory _DeliveryResponse.fromJson(Map<String, dynamic> json) =
      _$_DeliveryResponse.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$_DeliveryResponseCopyWith<_$_DeliveryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
