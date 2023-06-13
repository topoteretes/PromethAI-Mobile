// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

HistoryEntry _$HistoryEntryFromJson(Map<String, dynamic> json) {
  return _HistoryEntry.fromJson(json);
}

/// @nodoc
mixin _$HistoryEntry {
  Recipe get recipe => throw _privateConstructorUsedError;
  int get created => throw _privateConstructorUsedError;
  bool get favorite => throw _privateConstructorUsedError;
  String get prompt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistoryEntryCopyWith<HistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryEntryCopyWith<$Res> {
  factory $HistoryEntryCopyWith(
          HistoryEntry value, $Res Function(HistoryEntry) then) =
      _$HistoryEntryCopyWithImpl<$Res, HistoryEntry>;
  @useResult
  $Res call({Recipe recipe, int created, bool favorite, String prompt});

  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class _$HistoryEntryCopyWithImpl<$Res, $Val extends HistoryEntry>
    implements $HistoryEntryCopyWith<$Res> {
  _$HistoryEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? created = null,
    Object? favorite = null,
    Object? prompt = null,
  }) {
    return _then(_value.copyWith(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RecipeCopyWith<$Res> get recipe {
    return $RecipeCopyWith<$Res>(_value.recipe, (value) {
      return _then(_value.copyWith(recipe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HistoryEntryCopyWith<$Res>
    implements $HistoryEntryCopyWith<$Res> {
  factory _$$_HistoryEntryCopyWith(
          _$_HistoryEntry value, $Res Function(_$_HistoryEntry) then) =
      __$$_HistoryEntryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Recipe recipe, int created, bool favorite, String prompt});

  @override
  $RecipeCopyWith<$Res> get recipe;
}

/// @nodoc
class __$$_HistoryEntryCopyWithImpl<$Res>
    extends _$HistoryEntryCopyWithImpl<$Res, _$_HistoryEntry>
    implements _$$_HistoryEntryCopyWith<$Res> {
  __$$_HistoryEntryCopyWithImpl(
      _$_HistoryEntry _value, $Res Function(_$_HistoryEntry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipe = null,
    Object? created = null,
    Object? favorite = null,
    Object? prompt = null,
  }) {
    return _then(_$_HistoryEntry(
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as Recipe,
      created: null == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _value.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_HistoryEntry implements _HistoryEntry {
  const _$_HistoryEntry(
      {required this.recipe,
      required this.created,
      required this.favorite,
      required this.prompt});

  factory _$_HistoryEntry.fromJson(Map<String, dynamic> json) =>
      _$$_HistoryEntryFromJson(json);

  @override
  final Recipe recipe;
  @override
  final int created;
  @override
  final bool favorite;
  @override
  final String prompt;

  @override
  String toString() {
    return 'HistoryEntry(recipe: $recipe, created: $created, favorite: $favorite, prompt: $prompt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HistoryEntry &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.prompt, prompt) || other.prompt == prompt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, recipe, created, favorite, prompt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HistoryEntryCopyWith<_$_HistoryEntry> get copyWith =>
      __$$_HistoryEntryCopyWithImpl<_$_HistoryEntry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_HistoryEntryToJson(
      this,
    );
  }
}

abstract class _HistoryEntry implements HistoryEntry {
  const factory _HistoryEntry(
      {required final Recipe recipe,
      required final int created,
      required final bool favorite,
      required final String prompt}) = _$_HistoryEntry;

  factory _HistoryEntry.fromJson(Map<String, dynamic> json) =
      _$_HistoryEntry.fromJson;

  @override
  Recipe get recipe;
  @override
  int get created;
  @override
  bool get favorite;
  @override
  String get prompt;
  @override
  @JsonKey(ignore: true)
  _$$_HistoryEntryCopyWith<_$_HistoryEntry> get copyWith =>
      throw _privateConstructorUsedError;
}
