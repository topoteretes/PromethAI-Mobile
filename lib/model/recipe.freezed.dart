// coverage:ignore-file
// ignore_for_file: non_constant_identifier_names

// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: "prep_time")
  String get prepTime => throw _privateConstructorUsedError;
  @JsonKey(name: "cook_time")
  String get cookTime => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  List<String> get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) = _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: "prep_time") String prepTime,
      @JsonKey(name: "cook_time") String cookTime,
      String description,
      List<String> ingredients,
      List<String> instructions});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe> implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? prepTime = null,
    Object? cookTime = null,
    Object? description = null,
    Object? ingredients = null,
    Object? instructions = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prepTime: null == prepTime
          ? _value.prepTime
          : prepTime // ignore: cast_nullable_to_non_nullable
              as String,
      cookTime: null == cookTime
          ? _value.cookTime
          : cookTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) = __$$_RecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      @JsonKey(name: "prep_time") String prepTime,
      @JsonKey(name: "cook_time") String cookTime,
      String description,
      List<String> ingredients,
      List<String> instructions});
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res> extends _$RecipeCopyWithImpl<$Res, _$_Recipe> implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then) : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? prepTime = null,
    Object? cookTime = null,
    Object? description = null,
    Object? ingredients = null,
    Object? instructions = null,
  }) {
    return _then(_$_Recipe(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prepTime: null == prepTime
          ? _value.prepTime
          : prepTime // ignore: cast_nullable_to_non_nullable
              as String,
      cookTime: null == cookTime
          ? _value.cookTime
          : cookTime // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      instructions: null == instructions
          ? _value._instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  const _$_Recipe(
      {required this.title,
      @JsonKey(name: "prep_time") required this.prepTime,
      @JsonKey(name: "cook_time") required this.cookTime,
      required this.description,
      required final List<String> ingredients,
      required final List<String> instructions})
      : _ingredients = ingredients,
        _instructions = instructions;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) => _$$_RecipeFromJson(json);

  @override
  final String title;
  @override
  @JsonKey(name: "prep_time")
  final String prepTime;
  @override
  @JsonKey(name: "cook_time")
  final String cookTime;
  @override
  final String description;
  final List<String> _ingredients;
  @override
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _instructions;
  @override
  List<String> get instructions {
    if (_instructions is EqualUnmodifiableListView) return _instructions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_instructions);
  }

  @override
  String toString() {
    return 'Recipe(title: $title, prepTime: $prepTime, cookTime: $cookTime, description: $description, ingredients: $ingredients, instructions: $instructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.prepTime, prepTime) || other.prepTime == prepTime) &&
            (identical(other.cookTime, cookTime) || other.cookTime == cookTime) &&
            (identical(other.description, description) || other.description == description) &&
            const DeepCollectionEquality().equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality().equals(other._instructions, _instructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, prepTime, cookTime, description, const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_instructions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith => __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  const factory _Recipe(
      {required final String title,
      @JsonKey(name: "prep_time") required final String prepTime,
      @JsonKey(name: "cook_time") required final String cookTime,
      required final String description,
      required final List<String> ingredients,
      required final List<String> instructions}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  String get title;
  @override
  @JsonKey(name: "prep_time")
  String get prepTime;
  @override
  @JsonKey(name: "cook_time")
  String get cookTime;
  @override
  String get description;
  @override
  List<String> get ingredients;
  @override
  List<String> get instructions;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith => throw _privateConstructorUsedError;
}
