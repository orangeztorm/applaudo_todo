import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppSvg extends StatelessWidget {
  const AppSvg({
    required this.height,
    required this.width,
    required this.asset,
    super.key,
    
  });

  final double height;
  final double width;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      height: height,
      width: width,
    );
  }
}

class AppPng extends StatelessWidget {
  const AppPng({
    required this.height,
    required this.width,
    required this.asset,
    super.key,
  });

  final double height;
  final double width;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      height: height,
      width: width,
    );
  }
}
