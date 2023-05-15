// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_goal_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DietGoalResponse _$DietGoalResponseFromJson(Map<String, dynamic> json) {
  return _DietGoalResponse.fromJson(json);
}

/// @nodoc
mixin _$DietGoalResponse {
  List<String> get goals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DietGoalResponseCopyWith<DietGoalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietGoalResponseCopyWith<$Res> {
  factory $DietGoalResponseCopyWith(
          DietGoalResponse value, $Res Function(DietGoalResponse) then) =
      _$DietGoalResponseCopyWithImpl<$Res, DietGoalResponse>;
  @useResult
  $Res call({List<String> goals});
}

/// @nodoc
class _$DietGoalResponseCopyWithImpl<$Res, $Val extends DietGoalResponse>
    implements $DietGoalResponseCopyWith<$Res> {
  _$DietGoalResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
  }) {
    return _then(_value.copyWith(
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DietGoalResponseCopyWith<$Res>
    implements $DietGoalResponseCopyWith<$Res> {
  factory _$$_DietGoalResponseCopyWith(
          _$_DietGoalResponse value, $Res Function(_$_DietGoalResponse) then) =
      __$$_DietGoalResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> goals});
}

/// @nodoc
class __$$_DietGoalResponseCopyWithImpl<$Res>
    extends _$DietGoalResponseCopyWithImpl<$Res, _$_DietGoalResponse>
    implements _$$_DietGoalResponseCopyWith<$Res> {
  __$$_DietGoalResponseCopyWithImpl(
      _$_DietGoalResponse _value, $Res Function(_$_DietGoalResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goals = null,
  }) {
    return _then(_$_DietGoalResponse(
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DietGoalResponse implements _DietGoalResponse {
  const _$_DietGoalResponse({required final List<String> goals})
      : _goals = goals;

  factory _$_DietGoalResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DietGoalResponseFromJson(json);

  final List<String> _goals;
  @override
  List<String> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  String toString() {
    return 'DietGoalResponse(goals: $goals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DietGoalResponse &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DietGoalResponseCopyWith<_$_DietGoalResponse> get copyWith =>
      __$$_DietGoalResponseCopyWithImpl<_$_DietGoalResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DietGoalResponseToJson(
      this,
    );
  }
}

abstract class _DietGoalResponse implements DietGoalResponse {
  const factory _DietGoalResponse({required final List<String> goals}) =
      _$_DietGoalResponse;

  factory _DietGoalResponse.fromJson(Map<String, dynamic> json) =
      _$_DietGoalResponse.fromJson;

  @override
  List<String> get goals;
  @override
  @JsonKey(ignore: true)
  _$$_DietGoalResponseCopyWith<_$_DietGoalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
