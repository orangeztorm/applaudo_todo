import 'package:applaudo_todo/core/core.dart';
import 'package:flutter/widgets.dart';

class AppExpanded extends StatelessWidget {
  const AppExpanded(
    Key? key, {
    required this.child,
    this.flex = 1,
  }) : super(key: key);

  const AppExpanded.regular({
    super.key,
    Widget content = const SizedBox(),
    this.flex = 1,
  }) : child = content;

  AppExpanded.column({
    required List<Widget> children,
    super.key,
    this.flex = 1,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
  }) : child = Column(
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        );

  AppExpanded.scrollableColumn({
    required List<Widget> children,
    super.key,
    this.flex = 1,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    VerticalDirection? verticalDirection,
    EdgeInsetsGeometry? padding,
    TextDirection? textDirection,
    TextBaseline? textBaseline,
    ScrollPhysics? physics,
  }) : child = AppScrollableColumn(
          physics: physics,
          padding: padding,
          mainAxisAlignment: mainAxisAlignment,
          crossAxisAlignment: crossAxisAlignment,
          verticalDirection: verticalDirection,
          textDirection: textDirection,
          textBaseline: textBaseline,
          children: children,
        );

  final Widget child;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: child,
    );
  }
}
