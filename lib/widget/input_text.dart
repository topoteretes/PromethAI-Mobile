import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../theme.dart';
import 'theme_selectors.dart';

class InputText extends HookWidget {
  final String? title;
  final String? placeholder;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool nonEditable;
  final ValueChanged<String> onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final String? prefixText;
  final TextEditingController? controller;
  final String? value;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final double cornerRadius;
  final Color backgroundColor;
  final Color borderColor;
  final bool autofocus;
  final int? minLines;
  final FocusNode? focusNode;
  final String? error;

  const InputText(
      {Key? key,
      this.title,
      required this.onChanged,
      this.onEditingComplete,
      this.onTap,
      this.obscureText = false,
      this.enabled = true,
      this.nonEditable = false,
      this.textInputAction = TextInputAction.next,
      this.inputFormatters,
      this.keyboardType,
      this.prefixText,
      this.controller,
      this.value,
      this.suffixIcon,
      this.validator,
      this.onFieldSubmitted,
      this.placeholder,
      this.autofocus = false,
      this.minLines,
      this.readOnly = false,
      this.focusNode,
      this.error,
      this.backgroundColor = C.back,
      this.borderColor = C.front,
      this.cornerRadius = 24})
      : super(key: key);

  static InputDecoration getDecoration(
      {required ThemeData theme,
      required BuildContext context,
      String? title,
      String? prefixText,
      String? error,
      Widget? suffixIcon,
      double cornerRadius = 12,
      Color backgroundColor = C.back,
      Color borderColor = C.front,
      String? placeholder}) {
    return InputDecoration(
        labelText: title,
        prefixText: prefixText,
        contentPadding: const EdgeInsets.fromLTRB(20, 0, 28, 16),
        suffixIcon: suffixIcon,
        errorText: error,
        errorMaxLines: 2,
        fillColor: backgroundColor,
        hintText: placeholder,
        hintStyle: tt(context).labelMedium!.copyWith(color: C.grey3),
        labelStyle: tt(context).labelSmall,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
          borderSide: BorderSide(color: borderColor, width: 0.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
          borderSide: BorderSide(color: borderColor, width: 0.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
          borderSide: const BorderSide(color: C.front, width: 2.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final passwordVisible = useState(false);
    final icon = passwordVisible.value ? Icons.visibility_off : Icons.visibility;
    final onPressed = useCallback(() => passwordVisible.value = !passwordVisible.value, [passwordVisible.value]);
    final suffixFallback = obscureText ? IconButton(icon: Icon(icon), onPressed: onPressed) : null;
    final suffix = suffixIcon ?? suffixFallback;

    return Container(
      margin: const EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: TextFormField(
          enableInteractiveSelection: !nonEditable,
          focusNode: focusNode ?? (nonEditable ? AlwaysDisabledFocusNode() : null),
          initialValue: value,
          onChanged: onChanged,
          onTap: onTap,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          obscureText: passwordVisible.value ? false : obscureText,
          keyboardType: keyboardType ?? TextInputType.multiline,
          enabled: enabled,
          readOnly: readOnly,
          controller: controller,
          textInputAction: textInputAction,
          autocorrect: false,
          onEditingComplete: onEditingComplete,
          style: tt(context).labelMedium,
          inputFormatters: inputFormatters,
          onFieldSubmitted: onFieldSubmitted,
          autofocus: autofocus,
          maxLines: null,
          minLines: minLines,
          decoration: getDecoration(
              context: context,
              theme: theme,
              title: title,
              prefixText: prefixText,
              suffixIcon: suffix,
              error: error,
              cornerRadius: cornerRadius,
              borderColor: borderColor,
              placeholder: placeholder,
              backgroundColor: backgroundColor)),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
