import 'package:flutter/widgets.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.decoration,
    this.foregroundDecoration,
    this.alignment,
    this.clipBehavior = Clip.none,
    this.constraints,
    this.transform,
    this.transformAlignment,
    this.child,
  });

  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Clip clipBehavior;
  final BoxConstraints? constraints;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      alignment: alignment,
      clipBehavior: clipBehavior,
      constraints: constraints,
      transform: transform,
      transformAlignment: transformAlignment,
      child: child,
    );
  }
}
