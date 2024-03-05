// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PromptInput _$PromptInputFromJson(Map<String, dynamic> json) {
  return _PromptInput.fromJson(json);
}

/// @nodoc
mixin _$PromptInput {
  String get prompt => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: "num_inference_steps")
  int get numInferenceSteps => throw _privateConstructorUsedError;
  String get scheduler => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PromptInputCopyWith<PromptInput> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptInputCopyWith<$Res> {
  factory $PromptInputCopyWith(
          PromptInput value, $Res Function(PromptInput) then) =
      _$PromptInputCopyWithImpl<$Res, PromptInput>;
  @useResult
  $Res call(
      {String prompt,
      int width,
      int height,
      @JsonKey(name: "num_inference_steps") int numInferenceSteps,
      String scheduler});
}

/// @nodoc
class _$PromptInputCopyWithImpl<$Res, $Val extends PromptInput>
    implements $PromptInputCopyWith<$Res> {
  _$PromptInputCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? width = null,
    Object? height = null,
    Object? numInferenceSteps = null,
    Object? scheduler = null,
  }) {
    return _then(_value.copyWith(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      numInferenceSteps: null == numInferenceSteps
          ? _value.numInferenceSteps
          : numInferenceSteps // ignore: cast_nullable_to_non_nullable
              as int,
      scheduler: null == scheduler
          ? _value.scheduler
          : scheduler // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PromptInputCopyWith<$Res>
    implements $PromptInputCopyWith<$Res> {
  factory _$$_PromptInputCopyWith(
          _$_PromptInput value, $Res Function(_$_PromptInput) then) =
      __$$_PromptInputCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String prompt,
      int width,
      int height,
      @JsonKey(name: "num_inference_steps") int numInferenceSteps,
      String scheduler});
}

/// @nodoc
class __$$_PromptInputCopyWithImpl<$Res>
    extends _$PromptInputCopyWithImpl<$Res, _$_PromptInput>
    implements _$$_PromptInputCopyWith<$Res> {
  __$$_PromptInputCopyWithImpl(
      _$_PromptInput _value, $Res Function(_$_PromptInput) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = null,
    Object? width = null,
    Object? height = null,
    Object? numInferenceSteps = null,
    Object? scheduler = null,
  }) {
    return _then(_$_PromptInput(
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      numInferenceSteps: null == numInferenceSteps
          ? _value.numInferenceSteps
          : numInferenceSteps // ignore: cast_nullable_to_non_nullable
              as int,
      scheduler: null == scheduler
          ? _value.scheduler
          : scheduler // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PromptInput implements _PromptInput {
  const _$_PromptInput(
      {required this.prompt,
      required this.width,
      required this.height,
      @JsonKey(name: "num_inference_steps") required this.numInferenceSteps,
      required this.scheduler});

  factory _$_PromptInput.fromJson(Map<String, dynamic> json) =>
      _$$_PromptInputFromJson(json);

  @override
  final String prompt;
  @override
  final int width;
  @override
  final int height;
  @override
  @JsonKey(name: "num_inference_steps")
  final int numInferenceSteps;
  @override
  final String scheduler;

  @override
  String toString() {
    return 'PromptInput(prompt: $prompt, width: $width, height: $height, numInferenceSteps: $numInferenceSteps, scheduler: $scheduler)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PromptInput &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.numInferenceSteps, numInferenceSteps) ||
                other.numInferenceSteps == numInferenceSteps) &&
            (identical(other.scheduler, scheduler) ||
                other.scheduler == scheduler));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, prompt, width, height, numInferenceSteps, scheduler);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PromptInputCopyWith<_$_PromptInput> get copyWith =>
      __$$_PromptInputCopyWithImpl<_$_PromptInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PromptInputToJson(
      this,
    );
  }
}

abstract class _PromptInput implements PromptInput {
  const factory _PromptInput(
      {required final String prompt,
      required final int width,
      required final int height,
      @JsonKey(name: "num_inference_steps")
          required final int numInferenceSteps,
      required final String scheduler}) = _$_PromptInput;

  factory _PromptInput.fromJson(Map<String, dynamic> json) =
      _$_PromptInput.fromJson;

  @override
  String get prompt;
  @override
  int get width;
  @override
  int get height;
  @override
  @JsonKey(name: "num_inference_steps")
  int get numInferenceSteps;
  @override
  String get scheduler;
  @override
  @JsonKey(ignore: true)
  _$$_PromptInputCopyWith<_$_PromptInput> get copyWith =>
      throw _privateConstructorUsedError;
}
