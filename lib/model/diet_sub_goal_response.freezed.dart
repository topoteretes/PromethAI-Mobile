// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diet_sub_goal_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DietSubGoalResponse _$DietSubGoalResponseFromJson(Map<String, dynamic> json) {
  return _DietSubGoalResponse.fromJson(json);
}

/// @nodoc
mixin _$DietSubGoalResponse {
  @JsonKey(name: "sub_goals")
  List<SubGoal> get subGoals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DietSubGoalResponseCopyWith<DietSubGoalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DietSubGoalResponseCopyWith<$Res> {
  factory $DietSubGoalResponseCopyWith(
          DietSubGoalResponse value, $Res Function(DietSubGoalResponse) then) =
      _$DietSubGoalResponseCopyWithImpl<$Res, DietSubGoalResponse>;
  @useResult
  $Res call({@JsonKey(name: "sub_goals") List<SubGoal> subGoals});
}

/// @nodoc
class _$DietSubGoalResponseCopyWithImpl<$Res, $Val extends DietSubGoalResponse>
    implements $DietSubGoalResponseCopyWith<$Res> {
  _$DietSubGoalResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subGoals = null,
  }) {
    return _then(_value.copyWith(
      subGoals: null == subGoals
          ? _value.subGoals
          : subGoals // ignore: cast_nullable_to_non_nullable
              as List<SubGoal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DietSubGoalResponseCopyWith<$Res>
    implements $DietSubGoalResponseCopyWith<$Res> {
  factory _$$_DietSubGoalResponseCopyWith(_$_DietSubGoalResponse value,
          $Res Function(_$_DietSubGoalResponse) then) =
      __$$_DietSubGoalResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: "sub_goals") List<SubGoal> subGoals});
}

/// @nodoc
class __$$_DietSubGoalResponseCopyWithImpl<$Res>
    extends _$DietSubGoalResponseCopyWithImpl<$Res, _$_DietSubGoalResponse>
    implements _$$_DietSubGoalResponseCopyWith<$Res> {
  __$$_DietSubGoalResponseCopyWithImpl(_$_DietSubGoalResponse _value,
      $Res Function(_$_DietSubGoalResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subGoals = null,
  }) {
    return _then(_$_DietSubGoalResponse(
      subGoals: null == subGoals
          ? _value._subGoals
          : subGoals // ignore: cast_nullable_to_non_nullable
              as List<SubGoal>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DietSubGoalResponse implements _DietSubGoalResponse {
  const _$_DietSubGoalResponse(
      {@JsonKey(name: "sub_goals") required final List<SubGoal> subGoals})
      : _subGoals = subGoals;

  factory _$_DietSubGoalResponse.fromJson(Map<String, dynamic> json) =>
      _$$_DietSubGoalResponseFromJson(json);

  final List<SubGoal> _subGoals;
  @override
  @JsonKey(name: "sub_goals")
  List<SubGoal> get subGoals {
    if (_subGoals is EqualUnmodifiableListView) return _subGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subGoals);
  }

  @override
  String toString() {
    return 'DietSubGoalResponse(subGoals: $subGoals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DietSubGoalResponse &&
            const DeepCollectionEquality().equals(other._subGoals, _subGoals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_subGoals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DietSubGoalResponseCopyWith<_$_DietSubGoalResponse> get copyWith =>
      __$$_DietSubGoalResponseCopyWithImpl<_$_DietSubGoalResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DietSubGoalResponseToJson(
      this,
    );
  }
}

abstract class _DietSubGoalResponse implements DietSubGoalResponse {
  const factory _DietSubGoalResponse(
          {@JsonKey(name: "sub_goals") required final List<SubGoal> subGoals}) =
      _$_DietSubGoalResponse;

  factory _DietSubGoalResponse.fromJson(Map<String, dynamic> json) =
      _$_DietSubGoalResponse.fromJson;

  @override
  @JsonKey(name: "sub_goals")
  List<SubGoal> get subGoals;
  @override
  @JsonKey(ignore: true)
  _$$_DietSubGoalResponseCopyWith<_$_DietSubGoalResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
