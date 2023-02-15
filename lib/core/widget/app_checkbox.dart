import 'package:flutter/widgets.dart';

class AppCheckbox extends StatelessWidget {
  // ignore: use_super_parameters
  const AppCheckbox({
    Key? key,
    this.value = false,
    this.checkedWidget = const SizedBox.shrink(),
    this.uncheckedWidget = const SizedBox.shrink(),
    this.checkedColor,
    this.uncheckedColor,
    this.disabledColor,
    this.border,
    this.borderRadius,
    this.size = 30,
    this.animationDuration = const Duration(milliseconds: 350),
    this.onChanged,
  }) : super(key: key);

  ///Define wether the checkbox is marked or not
  final bool value;

  ///Define the widget that is shown when Widgets is checked
  final Widget checkedWidget;

  ///Define the widget that is shown when Widgets is unchecked
  final Widget uncheckedWidget;

  ///Define the color that is shown when Widgets is checked
  final Color? checkedColor;

  ///Define the color that is shown when Widgets is unchecked
  final Color? uncheckedColor;

  ///Define the color that is shown when Widgets is disabled
  final Color? disabledColor;

  ///Define the border of the widget
  final Border? border;

  ///Define the borderRadius of the widget
  final BorderRadius? borderRadius;

  ///Define the size of the checkbox
  final double size;

  ///Define the duration of the animation. If any
  final Duration animationDuration;

  // ignore: inference_failure_on_function_return_type
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final Widget checkbox = ClipRRect(
      borderRadius: borderRadius,
      child: GestureDetector(
        onTap: () => onChanged?.call(value),
        child: AnimatedContainer(
          duration: animationDuration,
          height: size,
          width: size,
          decoration: BoxDecoration(
            color: value ? checkedColor : disabledColor,
            border: border,
            borderRadius: borderRadius,
          ),
          child: Center(
            child: value ? checkedWidget : uncheckedWidget,
          ),
        ),
      ),
    );
    return checkbox;
  }
}
