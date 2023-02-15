import 'package:applaudo_todo/core/core.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  /// [AppTextField] constructor
  // ignore: use_super_parameters
  const AppTextField({
    Key? key,
    this.controller,
    this.onChanged,
    this.autofocus = false,
    this.obscureText = false,
    this.hintText,
    this.errorText,
    this.keyboardType,
    this.maxLines,
    this.suffixIcon,
    this.fillColor,
    this.borderColor,
    // ignore: use_named_constants
    this.padding = const EdgeInsets.only(),
  }) : super(key: key);

  ///TextController
  final TextEditingController? controller;

  ///Gets called when text value changes
  // ignore: inference_failure_on_function_return_type
  final Function(String)? onChanged;

  /// Hide text content
  final bool obscureText;

  ///autofocus
  final bool autofocus;

  /// Hint text
  final String? hintText;

  /// Error text
  final String? errorText;

  ///Keyboard input type
  final TextInputType? keyboardType;

  ///Max number of lines
  final int? maxLines;

  ///SuffixIcon widget
  final Widget? suffixIcon;

  ///Fill Color
  final Color? fillColor;

  ///Border Color
  final Color? borderColor;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const commonBorderRadius = BorderRadius.only(
      topLeft: Radius.circular(4),
      topRight: Radius.circular(4),
    );
    final fieldBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.transparent,
        // width: 1.0,
      ),
      borderRadius: commonBorderRadius,
    );

    final focusedBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        color: theme.primaryColor,
        width: 2,
        // width: 1.0,
      ),
    );

    final errorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.red,
        // width: 1.0,
      ),
      borderRadius: commonBorderRadius,
    );

    return Focus(
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final focusNode = Focus.of(context);
          final hasFocus = focusNode.hasFocus;
          return Padding(
            padding: padding,
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              autofocus: autofocus,
              maxLines: maxLines,
              cursorColor: Colors.transparent,
              keyboardType: keyboardType,
              textAlignVertical: TextAlignVertical.center,
              textInputAction: TextInputAction.next,
              obscureText: obscureText,
              decoration: InputDecoration(
                hintText: hintText,
                errorText: errorText,
                errorStyle: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.error,
                  height: Dimens.dp16,
                ),
                hintStyle: theme.inputDecorationTheme.hintStyle,
                enabledBorder: fieldBorder,
                focusedBorder: focusedBorder,
                fillColor: theme.inputDecorationTheme.fillColor,
                suffix: suffixIcon,
                errorBorder: errorBorder,
                label: hasFocus
                    ? (hintText != null ? Text(hintText!) : null)
                    : null,
                labelStyle: theme.textTheme.bodyMedium?.copyWith(
                  color: hasFocus
                      ? theme.primaryColor
                      : theme.inputDecorationTheme.labelStyle?.color,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                focusedErrorBorder: errorBorder,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(
                  16,
                  16,
                  12,
                  suffixIcon == null ? 12 : 7,
                ),
              ),
              style: theme.textTheme.displayMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: Dimens.dp18,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
      ),
    );
  }
}
