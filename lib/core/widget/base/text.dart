import 'package:flutter/widgets.dart';

// enum AppTextLevel {
//   // ignore: public_member_api_docs
//   heading1,
// // ignore: public_member_api_docs
//   heading2,
//   // ignore: public_member_api_docs
//   heading3,
//   // ignore: public_member_api_docs
//   heading4,
//   // ignore: public_member_api_docs
//   heading5,
//   // ignore: public_member_api_docs
//   heading6,
//   // ignore: public_member_api_docs
//   subTitle1,
//   // ignore: public_member_api_docs
//   subTitle2,
//   // ignore: public_member_api_docs
//   body1,
//   // ignore: public_member_api_docs
//   body2,
// }

// /// Custom AppText widget from corresponding [AppTextLevel]
// class AppText extends StatelessWidget {
//   /// [AppText] widget constructor
//   const AppText(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.level = AppTextLevel.body1,
//     this.overflow,
//     this.textAlign = TextAlign.start,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.nunitoSans,
//   });

//   /// AppText widget from [AppTextLevel.heading1]
//   ///  - [72]px (regular)
//   const AppText.heading1(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.poppins,
//   }) : level = AppTextLevel.heading1;

//   /// AppText widget from [AppTextLevel.heading2]
//   ///  - [64px] (regular)
//   const AppText.heading2(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.poppins,
//   }) : level = AppTextLevel.heading2;

//   /// AppText widget from [AppTextLevel.heading3] - [48px](regular)
//   const AppText.heading3(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.poppins,
//   }) : level = AppTextLevel.heading3;

//   /// AppText widget from [AppTextLevel.heading4] - [36px](regular)
//   const AppText.heading4(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.poppins,
//   }) : level = AppTextLevel.heading4;

//   /// AppText widget from [AppTextLevel.heading5] - [24px](regular)
//   const AppText.heading5(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.poppins,
//   }) : level = AppTextLevel.heading5;

//   /// AppText widget from [AppTextLevel.heading6] - [18px] (regular)
//   const AppText.heading6(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.poppins,
//   }) : level = AppTextLevel.heading6;

//   /// AppText widget from [AppTextLevel.subTitle1] - [16px] (regular)
//   const AppText.subTitle1(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.nunitoSans,
//   }) : level = AppTextLevel.subTitle1;

//   /// AppText widget from [AppTextLevel.subTitle2] - [14px] (regular)
//   const AppText.subTitle2(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.nunitoSans,
//   }) : level = AppTextLevel.subTitle2;

//   /// AppText widget from [AppTextLevel.body1] - [16px] (regular)
//   const AppText.body1(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.nunitoSans,
//   }) : level = AppTextLevel.body1;

//   /// AppText widget from [AppTextLevel.body2] - [14px] (regular)
//   const AppText.body2(
//     this.data, {
//     super.key,
//     this.color,
//     this.fontSize,
//     this.fontWeight,
//     this.maxLines,
//     this.textAlign = TextAlign.start,
//     this.overflow,
//     this.fontStyle,
//     this.decoration,
//     this.fontFamily = AppFontFamily.nunitoSans,
//   }) : level = AppTextLevel.body2;

//   ///The data held in the Text widget
//   final String data;

//   /// AppTextLevel
//   final AppTextLevel level;

//   /// Text color (32-bit)
//   final Color? color;

//   /// Text font size
//   final double? fontSize;

//   /// Text font size
//   final FontWeight? fontWeight;

//   /// Maximun number of lines the text can have
//   final int? maxLines;

//   /// How text is aligned vertically
//   final TextAlign textAlign;

//   /// How text overflow is handled
//   final TextOverflow? overflow;

//   ///Fontstyle
//   final FontStyle? fontStyle;

//   ///TextDecoration
//   final TextDecoration? decoration;

//   final AppFontFamily fontFamily;

//   @override
//   Widget build(BuildContext context) {
//     final theme = AppTheme.of(context);
//     final color = this.color ?? theme.colors.constrastBunker;
//     final style = () {
//       switch (level) {
//         case AppTextLevel.heading1:
//           return theme.typography.heading1;
//         case AppTextLevel.heading2:
//           return theme.typography.heading2;
//         case AppTextLevel.heading3:
//           return theme.typography.heading3;
//         case AppTextLevel.heading4:
//           return theme.typography.heading4;
//         case AppTextLevel.heading5:
//           return theme.typography.heading5;
//         case AppTextLevel.heading6:
//           return theme.typography.heading6;
//         case AppTextLevel.subTitle1:
//           return theme.typography.subTitle1;
//         case AppTextLevel.subTitle2:
//           return theme.typography.subTitle2;
//         case AppTextLevel.body1:
//           return theme.typography.body1;
//         case AppTextLevel.body2:
//           return theme.typography.body2;
//       }
//     }();
//     return Text(
//       data,
//       style: style.copyWith(
//         color: color,
//         fontSize: fontSize,
//         fontWeight: fontWeight,
//         letterSpacing: 0.2,
//         height: 1.3,
//         fontStyle: fontStyle,
//         decoration: decoration,
//         decorationThickness: 0.5,
//         fontFamily: fontFamily.value,
//       ),
//       maxLines: maxLines,
//       overflow: overflow,
//       textAlign: textAlign,
//     );
//   }
// }

// // ignore: public_member_api_docs
// enum AppFontFamily { poppins, nunitoSans }

// extension _AppFontFamilyX on AppFontFamily {
//   String get value {
//     switch (this) {
//       case AppFontFamily.poppins:
//         return 'Poppins';
//       case AppFontFamily.nunitoSans:
//         return 'Nunito Sans';
//     }
//   }
// }

class AppText extends StatelessWidget {
  const AppText({
    required this.data,
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.maxLines,
    this.overflow,
    this.textAlign = TextAlign.start,
    this.fontStyle,
    this.decoration,
    this.fontFamily = 'Inter',
  });

  ///The data held in the Text widget
  /// AppTextLevel
  /// Text color (32-bit)
  /// Text font size
  /// Maximun number of lines the text can have
  /// How text is aligned vertically
  /// How text overflow is handled
  /// Fontstyle
  /// TextDecoration
  /// Text font size=

  final String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign textAlign;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final String fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: 0.2,
        height: 1.3,
        fontStyle: fontStyle,
        decoration: decoration,
        decorationThickness: 0.5,
        fontFamily: fontFamily,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
