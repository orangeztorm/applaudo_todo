import 'package:applaudo_todo/core/core.dart';
import 'package:flutter/cupertino.dart';

class IosAppButton extends StatelessWidget {
  const IosAppButton({
    required this.title,
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.color,
    this.borderColor,
    this.textColor,
    this.child,
    this.mainAxisSize = MainAxisSize.min,
  });

  final String title;
  final MainAxisSize mainAxisSize;
  final VoidCallback? onTap;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: height,
      height: width,
      child: CupertinoButton(
        onPressed: onTap,
        color: color,
        borderRadius: BorderRadius.circular(4),
        child: child ??
            Center(
              child: AppText(
                data: title,
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
      ),
    );
  }
}
