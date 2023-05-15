// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name_amount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NameAmount _$NameAmountFromJson(Map<String, dynamic> json) {
  return _NameAmount.fromJson(json);
}

/// @nodoc
mixin _$NameAmount {
  String get name => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameAmountCopyWith<NameAmount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NameAmountCopyWith<$Res> {
  factory $NameAmountCopyWith(
          NameAmount value, $Res Function(NameAmount) then) =
      _$NameAmountCopyWithImpl<$Res, NameAmount>;
  @useResult
  $Res call({String name, int amount});
}

/// @nodoc
class _$NameAmountCopyWithImpl<$Res, $Val extends NameAmount>
    implements $NameAmountCopyWith<$Res> {
  _$NameAmountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NameAmountCopyWith<$Res>
    implements $NameAmountCopyWith<$Res> {
  factory _$$_NameAmountCopyWith(
          _$_NameAmount value, $Res Function(_$_NameAmount) then) =
      __$$_NameAmountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int amount});
}

/// @nodoc
class __$$_NameAmountCopyWithImpl<$Res>
    extends _$NameAmountCopyWithImpl<$Res, _$_NameAmount>
    implements _$$_NameAmountCopyWith<$Res> {
  __$$_NameAmountCopyWithImpl(
      _$_NameAmount _value, $Res Function(_$_NameAmount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? amount = null,
  }) {
    return _then(_$_NameAmount(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NameAmount implements _NameAmount {
  const _$_NameAmount({required this.name, required this.amount});

  factory _$_NameAmount.fromJson(Map<String, dynamic> json) =>
      _$$_NameAmountFromJson(json);

  @override
  final String name;
  @override
  final int amount;

  @override
  String toString() {
    return 'NameAmount(name: $name, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameAmount &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameAmountCopyWith<_$_NameAmount> get copyWith =>
      __$$_NameAmountCopyWithImpl<_$_NameAmount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NameAmountToJson(
      this,
    );
  }
}

abstract class _NameAmount implements NameAmount {
  const factory _NameAmount(
      {required final String name, required final int amount}) = _$_NameAmount;

  factory _NameAmount.fromJson(Map<String, dynamic> json) =
      _$_NameAmount.fromJson;

  @override
  String get name;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$_NameAmountCopyWith<_$_NameAmount> get copyWith =>
      throw _privateConstructorUsedError;
}
