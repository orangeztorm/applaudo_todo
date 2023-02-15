// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';

class CommonProgressIndicator extends StatelessWidget {
  const CommonProgressIndicator({
    super.key,
    this.color,
    this.size = 14.0,
  });

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ProgressIndicator(
      width: size,
      height: size,
      color: color ?? theme.primaryColor,
    );
  }
}

class ProgressIndicator extends StatelessWidget {
  const ProgressIndicator({
    required this.width,
    required this.height,
    required this.color,
    super.key,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}
