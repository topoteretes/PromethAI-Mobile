// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_goal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubGoal _$SubGoalFromJson(Map<String, dynamic> json) {
  return _SubGoal.fromJson(json);
}

/// @nodoc
mixin _$SubGoal {
  @JsonKey(name: "goal_name")
  String get goalName => throw _privateConstructorUsedError;
  @JsonKey(name: "sub_goals")
  List<NameAmount> get subGoals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubGoalCopyWith<SubGoal> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubGoalCopyWith<$Res> {
  factory $SubGoalCopyWith(SubGoal value, $Res Function(SubGoal) then) =
      _$SubGoalCopyWithImpl<$Res, SubGoal>;
  @useResult
  $Res call(
      {@JsonKey(name: "goal_name") String goalName,
      @JsonKey(name: "sub_goals") List<NameAmount> subGoals});
}

/// @nodoc
class _$SubGoalCopyWithImpl<$Res, $Val extends SubGoal>
    implements $SubGoalCopyWith<$Res> {
  _$SubGoalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalName = null,
    Object? subGoals = null,
  }) {
    return _then(_value.copyWith(
      goalName: null == goalName
          ? _value.goalName
          : goalName // ignore: cast_nullable_to_non_nullable
              as String,
      subGoals: null == subGoals
          ? _value.subGoals
          : subGoals // ignore: cast_nullable_to_non_nullable
              as List<NameAmount>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubGoalCopyWith<$Res> implements $SubGoalCopyWith<$Res> {
  factory _$$_SubGoalCopyWith(
          _$_SubGoal value, $Res Function(_$_SubGoal) then) =
      __$$_SubGoalCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "goal_name") String goalName,
      @JsonKey(name: "sub_goals") List<NameAmount> subGoals});
}

/// @nodoc
class __$$_SubGoalCopyWithImpl<$Res>
    extends _$SubGoalCopyWithImpl<$Res, _$_SubGoal>
    implements _$$_SubGoalCopyWith<$Res> {
  __$$_SubGoalCopyWithImpl(_$_SubGoal _value, $Res Function(_$_SubGoal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? goalName = null,
    Object? subGoals = null,
  }) {
    return _then(_$_SubGoal(
      goalName: null == goalName
          ? _value.goalName
          : goalName // ignore: cast_nullable_to_non_nullable
              as String,
      subGoals: null == subGoals
          ? _value._subGoals
          : subGoals // ignore: cast_nullable_to_non_nullable
              as List<NameAmount>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubGoal implements _SubGoal {
  const _$_SubGoal(
      {@JsonKey(name: "goal_name") required this.goalName,
      @JsonKey(name: "sub_goals") required final List<NameAmount> subGoals})
      : _subGoals = subGoals;

  factory _$_SubGoal.fromJson(Map<String, dynamic> json) =>
      _$$_SubGoalFromJson(json);

  @override
  @JsonKey(name: "goal_name")
  final String goalName;
  final List<NameAmount> _subGoals;
  @override
  @JsonKey(name: "sub_goals")
  List<NameAmount> get subGoals {
    if (_subGoals is EqualUnmodifiableListView) return _subGoals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subGoals);
  }

  @override
  String toString() {
    return 'SubGoal(goalName: $goalName, subGoals: $subGoals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubGoal &&
            (identical(other.goalName, goalName) ||
                other.goalName == goalName) &&
            const DeepCollectionEquality().equals(other._subGoals, _subGoals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, goalName, const DeepCollectionEquality().hash(_subGoals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubGoalCopyWith<_$_SubGoal> get copyWith =>
      __$$_SubGoalCopyWithImpl<_$_SubGoal>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubGoalToJson(
      this,
    );
  }
}

abstract class _SubGoal implements SubGoal {
  const factory _SubGoal(
      {@JsonKey(name: "goal_name")
          required final String goalName,
      @JsonKey(name: "sub_goals")
          required final List<NameAmount> subGoals}) = _$_SubGoal;

  factory _SubGoal.fromJson(Map<String, dynamic> json) = _$_SubGoal.fromJson;

  @override
  @JsonKey(name: "goal_name")
  String get goalName;
  @override
  @JsonKey(name: "sub_goals")
  List<NameAmount> get subGoals;
  @override
  @JsonKey(ignore: true)
  _$$_SubGoalCopyWith<_$_SubGoal> get copyWith =>
      throw _privateConstructorUsedError;
}
