// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Prompt _$PromptFromJson(Map<String, dynamic> json) {
  return _Prompt.fromJson(json);
}

/// @nodoc
mixin _$Prompt {
  String get original => throw _privateConstructorUsedError;
  String get current => throw _privateConstructorUsedError;
  List<String> get changed => throw _privateConstructorUsedError;
  Map<String, String> get originalMap => throw _privateConstructorUsedError;
  bool get updating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptCopyWith<Prompt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptCopyWith<$Res> {
  factory $PromptCopyWith(Prompt value, $Res Function(Prompt) then) =
      _$PromptCopyWithImpl<$Res, Prompt>;
  @useResult
  $Res call(
      {String original,
      String current,
      List<String> changed,
      Map<String, String> originalMap,
      bool updating});
}

/// @nodoc
class _$PromptCopyWithImpl<$Res, $Val extends Prompt>
    implements $PromptCopyWith<$Res> {
  _$PromptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? current = null,
    Object? changed = null,
    Object? originalMap = null,
    Object? updating = null,
  }) {
    return _then(_value.copyWith(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as String,
      changed: null == changed
          ? _value.changed
          : changed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      originalMap: null == originalMap
          ? _value.originalMap
          : originalMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      updating: null == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromptCopyWith<$Res> implements $PromptCopyWith<$Res> {
  factory _$$_PromptCopyWith(_$_Prompt value, $Res Function(_$_Prompt) then) =
      __$$_PromptCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String original,
      String current,
      List<String> changed,
      Map<String, String> originalMap,
      bool updating});
}

/// @nodoc
class __$$_PromptCopyWithImpl<$Res>
    extends _$PromptCopyWithImpl<$Res, _$_Prompt>
    implements _$$_PromptCopyWith<$Res> {
  __$$_PromptCopyWithImpl(_$_Prompt _value, $Res Function(_$_Prompt) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? current = null,
    Object? changed = null,
    Object? originalMap = null,
    Object? updating = null,
  }) {
    return _then(_$_Prompt(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as String,
      changed: null == changed
          ? _value._changed
          : changed // ignore: cast_nullable_to_non_nullable
              as List<String>,
      originalMap: null == originalMap
          ? _value._originalMap
          : originalMap // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      updating: null == updating
          ? _value.updating
          : updating // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Prompt implements _Prompt {
  const _$_Prompt(
      {required this.original,
      required this.current,
      required final List<String> changed,
      required final Map<String, String> originalMap,
      required this.updating})
      : _changed = changed,
        _originalMap = originalMap;

  factory _$_Prompt.fromJson(Map<String, dynamic> json) =>
      _$$_PromptFromJson(json);

  @override
  final String original;
  @override
  final String current;
  final List<String> _changed;
  @override
  List<String> get changed {
    if (_changed is EqualUnmodifiableListView) return _changed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changed);
  }

  final Map<String, String> _originalMap;
  @override
  Map<String, String> get originalMap {
    if (_originalMap is EqualUnmodifiableMapView) return _originalMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_originalMap);
  }

  @override
  final bool updating;

  @override
  String toString() {
    return 'Prompt(original: $original, current: $current, changed: $changed, originalMap: $originalMap, updating: $updating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Prompt &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality().equals(other._changed, _changed) &&
            const DeepCollectionEquality()
                .equals(other._originalMap, _originalMap) &&
            (identical(other.updating, updating) ||
                other.updating == updating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      original,
      current,
      const DeepCollectionEquality().hash(_changed),
      const DeepCollectionEquality().hash(_originalMap),
      updating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromptCopyWith<_$_Prompt> get copyWith =>
      __$$_PromptCopyWithImpl<_$_Prompt>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromptToJson(
      this,
    );
  }
}

abstract class _Prompt implements Prompt {
  const factory _Prompt(
      {required final String original,
      required final String current,
      required final List<String> changed,
      required final Map<String, String> originalMap,
      required final bool updating}) = _$_Prompt;

  factory _Prompt.fromJson(Map<String, dynamic> json) = _$_Prompt.fromJson;

  @override
  String get original;
  @override
  String get current;
  @override
  List<String> get changed;
  @override
  Map<String, String> get originalMap;
  @override
  bool get updating;
  @override
  @JsonKey(ignore: true)
  _$$_PromptCopyWith<_$_Prompt> get copyWith =>
      throw _privateConstructorUsedError;
}
