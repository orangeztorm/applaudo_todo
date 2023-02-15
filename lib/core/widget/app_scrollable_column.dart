
import 'package:flutter/widgets.dart';

class AppScrollableColumn extends StatelessWidget {
  const AppScrollableColumn({
    required this.children,
    super.key,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisAlignment? mainAxisAlignment,
    VerticalDirection? verticalDirection,
    EdgeInsetsGeometry? padding,
    this.textBaseline,
    this.textDirection,
    this.physics,
    
  })  : crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisAlignment = mainAxisAlignment ?? MainAxisAlignment.start,
        verticalDirection = verticalDirection ?? VerticalDirection.down,
        padding = padding ?? EdgeInsets.zero;

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final VerticalDirection verticalDirection;
  final TextDirection? textDirection;
  final TextBaseline? textBaseline;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      const SizedBox(width: double.infinity),
      ...this.children
    ];
    return LayoutBuilder(
      builder: (context, constraint) {
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            physics: physics,
            child: Padding(
              padding: padding,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraint.maxHeight - padding.vertical,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: crossAxisAlignment,
                    mainAxisAlignment: mainAxisAlignment,
                    verticalDirection: verticalDirection,
                    textBaseline: textBaseline,
                    textDirection: textDirection,
                    children: children,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
