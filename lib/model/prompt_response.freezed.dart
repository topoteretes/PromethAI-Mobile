// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromptResponse _$PromptResponseFromJson(Map<String, dynamic> json) {
  return _PromptResponse.fromJson(json);
}

/// @nodoc
mixin _$PromptResponse {
  String get prompt => throw _privateConstructorUsedError;
  List<Tree> get tree => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptResponseCopyWith<PromptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptResponseCopyWith<$Res> {
  factory $PromptResponseCopyWith(
          PromptResponse value, $Res Function(PromptResponse) then) =
      _$PromptResponseCopyWithImpl<$Res, PromptResponse>;
  @useResult
  $Res call({String prompt, List<Tree> tree});
}

/// @nodoc
class _$PromptResponseCopyWithImpl<$Res, $Val extends PromptResponse>
    implements $PromptResponseCopyWith<$Res> {
  _$PromptResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? tree = null,
  }) {
    return _then(_value.copyWith(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      tree: null == tree
          ? _value.tree
          : tree // ignore: cast_nullable_to_non_nullable
              as List<Tree>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromptResponseCopyWith<$Res>
    implements $PromptResponseCopyWith<$Res> {
  factory _$$_PromptResponseCopyWith(
          _$_PromptResponse value, $Res Function(_$_PromptResponse) then) =
      __$$_PromptResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String prompt, List<Tree> tree});
}

/// @nodoc
class __$$_PromptResponseCopyWithImpl<$Res>
    extends _$PromptResponseCopyWithImpl<$Res, _$_PromptResponse>
    implements _$$_PromptResponseCopyWith<$Res> {
  __$$_PromptResponseCopyWithImpl(
      _$_PromptResponse _value, $Res Function(_$_PromptResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? tree = null,
  }) {
    return _then(_$_PromptResponse(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      tree: null == tree
          ? _value._tree
          : tree // ignore: cast_nullable_to_non_nullable
              as List<Tree>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromptResponse implements _PromptResponse {
  const _$_PromptResponse(
      {required this.prompt, required final List<Tree> tree})
      : _tree = tree;

  factory _$_PromptResponse.fromJson(Map<String, dynamic> json) =>
      _$$_PromptResponseFromJson(json);

  @override
  final String prompt;
  final List<Tree> _tree;
  @override
  List<Tree> get tree {
    if (_tree is EqualUnmodifiableListView) return _tree;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tree);
  }

  @override
  String toString() {
    return 'PromptResponse(prompt: $prompt, tree: $tree)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromptResponse &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            const DeepCollectionEquality().equals(other._tree, _tree));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, prompt, const DeepCollectionEquality().hash(_tree));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromptResponseCopyWith<_$_PromptResponse> get copyWith =>
      __$$_PromptResponseCopyWithImpl<_$_PromptResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromptResponseToJson(
      this,
    );
  }
}

abstract class _PromptResponse implements PromptResponse {
  const factory _PromptResponse(
      {required final String prompt,
      required final List<Tree> tree}) = _$_PromptResponse;

  factory _PromptResponse.fromJson(Map<String, dynamic> json) =
      _$_PromptResponse.fromJson;

  @override
  String get prompt;
  @override
  List<Tree> get tree;
  @override
  @JsonKey(ignore: true)
  _$$_PromptResponseCopyWith<_$_PromptResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
