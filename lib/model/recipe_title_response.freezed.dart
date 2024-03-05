// coverage:ignore-file
// ignore_for_file: non_constant_identifier_names

// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_title_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeTitleResponse _$RecipeTitleResponseFromJson(Map<String, dynamic> json) {
  return _RecipeTitleResponse.fromJson(json);
}

/// @nodoc
mixin _$RecipeTitleResponse {
  String get response => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeTitleResponseCopyWith<RecipeTitleResponse> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeTitleResponseCopyWith<$Res> {
  factory $RecipeTitleResponseCopyWith(RecipeTitleResponse value, $Res Function(RecipeTitleResponse) then) =
      _$RecipeTitleResponseCopyWithImpl<$Res, RecipeTitleResponse>;
  @useResult
  $Res call({String response});
}

/// @nodoc
class _$RecipeTitleResponseCopyWithImpl<$Res, $Val extends RecipeTitleResponse> implements $RecipeTitleResponseCopyWith<$Res> {
  _$RecipeTitleResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_value.copyWith(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeTitleResponseCopyWith<$Res> implements $RecipeTitleResponseCopyWith<$Res> {
  factory _$$_RecipeTitleResponseCopyWith(_$_RecipeTitleResponse value, $Res Function(_$_RecipeTitleResponse) then) =
      __$$_RecipeTitleResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String response});
}

/// @nodoc
class __$$_RecipeTitleResponseCopyWithImpl<$Res> extends _$RecipeTitleResponseCopyWithImpl<$Res, _$_RecipeTitleResponse>
    implements _$$_RecipeTitleResponseCopyWith<$Res> {
  __$$_RecipeTitleResponseCopyWithImpl(_$_RecipeTitleResponse _value, $Res Function(_$_RecipeTitleResponse) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$_RecipeTitleResponse(
      response: null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeTitleResponse implements _RecipeTitleResponse {
  const _$_RecipeTitleResponse({required this.response});

  factory _$_RecipeTitleResponse.fromJson(Map<String, dynamic> json) => _$$_RecipeTitleResponseFromJson(json);

  @override
  final String response;

  @override
  String toString() {
    return 'RecipeTitleResponse(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeTitleResponse &&
            (identical(other.response, response) || other.response == response));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeTitleResponseCopyWith<_$_RecipeTitleResponse> get copyWith =>
      __$$_RecipeTitleResponseCopyWithImpl<_$_RecipeTitleResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeTitleResponseToJson(
      this,
    );
  }
}

abstract class _RecipeTitleResponse implements RecipeTitleResponse {
  const factory _RecipeTitleResponse({required final String response}) = _$_RecipeTitleResponse;

  factory _RecipeTitleResponse.fromJson(Map<String, dynamic> json) = _$_RecipeTitleResponse.fromJson;

  @override
  String get response;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeTitleResponseCopyWith<_$_RecipeTitleResponse> get copyWith => throw _privateConstructorUsedError;
}
