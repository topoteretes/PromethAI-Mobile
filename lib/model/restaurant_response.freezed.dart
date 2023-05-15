// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RestaurantResponse _$RestaurantResponseFromJson(Map<String, dynamic> json) {
  return _RestaurantResponse.fromJson(json);
}

/// @nodoc
mixin _$RestaurantResponse {
  List<Restaurant> get restaurants => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantResponseCopyWith<RestaurantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantResponseCopyWith<$Res> {
  factory $RestaurantResponseCopyWith(
          RestaurantResponse value, $Res Function(RestaurantResponse) then) =
      _$RestaurantResponseCopyWithImpl<$Res, RestaurantResponse>;
  @useResult
  $Res call({List<Restaurant> restaurants});
}

/// @nodoc
class _$RestaurantResponseCopyWithImpl<$Res, $Val extends RestaurantResponse>
    implements $RestaurantResponseCopyWith<$Res> {
  _$RestaurantResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurants = null,
  }) {
    return _then(_value.copyWith(
      restaurants: null == restaurants
          ? _value.restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RestaurantResponseCopyWith<$Res>
    implements $RestaurantResponseCopyWith<$Res> {
  factory _$$_RestaurantResponseCopyWith(_$_RestaurantResponse value,
          $Res Function(_$_RestaurantResponse) then) =
      __$$_RestaurantResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Restaurant> restaurants});
}

/// @nodoc
class __$$_RestaurantResponseCopyWithImpl<$Res>
    extends _$RestaurantResponseCopyWithImpl<$Res, _$_RestaurantResponse>
    implements _$$_RestaurantResponseCopyWith<$Res> {
  __$$_RestaurantResponseCopyWithImpl(
      _$_RestaurantResponse _value, $Res Function(_$_RestaurantResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurants = null,
  }) {
    return _then(_$_RestaurantResponse(
      restaurants: null == restaurants
          ? _value._restaurants
          : restaurants // ignore: cast_nullable_to_non_nullable
              as List<Restaurant>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RestaurantResponse implements _RestaurantResponse {
  const _$_RestaurantResponse({required final List<Restaurant> restaurants})
      : _restaurants = restaurants;

  factory _$_RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$$_RestaurantResponseFromJson(json);

  final List<Restaurant> _restaurants;
  @override
  List<Restaurant> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  String toString() {
    return 'RestaurantResponse(restaurants: $restaurants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RestaurantResponse &&
            const DeepCollectionEquality()
                .equals(other._restaurants, _restaurants));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_restaurants));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RestaurantResponseCopyWith<_$_RestaurantResponse> get copyWith =>
      __$$_RestaurantResponseCopyWithImpl<_$_RestaurantResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RestaurantResponseToJson(
      this,
    );
  }
}

abstract class _RestaurantResponse implements RestaurantResponse {
  const factory _RestaurantResponse(
      {required final List<Restaurant> restaurants}) = _$_RestaurantResponse;

  factory _RestaurantResponse.fromJson(Map<String, dynamic> json) =
      _$_RestaurantResponse.fromJson;

  @override
  List<Restaurant> get restaurants;
  @override
  @JsonKey(ignore: true)
  _$$_RestaurantResponseCopyWith<_$_RestaurantResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
