import 'package:applaudo_todo/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LightTheme extends BaseTheme {
  LightTheme(this.primaryColor);

  final Color primaryColor;
  static const Color ghost = Color(0xFFB9B9BE);
  static const Color whiteSmoke = Color(0xFFF8F8F8);
  static const Color licorice = Color(0xFF292B35);
  static const Color comet = Color(0xFF575767);
  static const Color dividerColor = ghost;

  @override
  ColorScheme get scheme => ColorScheme.light(
        primary: primaryColor,
      );

  @override
  AppBarTheme get appBar => AppBarTheme(
        elevation: 0,
        color: whiteSmoke,
        iconTheme: IconThemeData(
          color: primaryColor,
        ),
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: Dimens.dp15,
          fontWeight: FontWeight.w600,
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      );

  @override
  ButtonThemeData get button => ButtonThemeData(
        buttonColor: primaryColor,
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dp12,
          horizontal: Dimens.dp24,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.dp8),
        ),
      );

  @override
  ElevatedButtonThemeData get elevatedButton => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.dp8),
          ),
          backgroundColor: primaryColor,
          foregroundColor: Colors.black,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.dp12,
            horizontal: Dimens.dp24,
          ),
          elevation: 0,
        ),
      );

  @override
  OutlinedButtonThemeData get outlinedButton => OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
        ),
      );

  @override
  InputDecorationTheme get inputDecoration {
    final baseBorder = OutlineInputBorder(
      borderSide: const BorderSide(color: ghost),
      borderRadius: BorderRadius.circular(Dimens.dp8),
    );

    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Dimens.dp12,
        horizontal: Dimens.dp16,
      ),
      enabledBorder: baseBorder,
      disabledBorder: baseBorder,
      border: baseBorder,
      focusedBorder:
          baseBorder.copyWith(borderSide: BorderSide(color: primaryColor)),
      focusedErrorBorder:
          baseBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
      errorBorder:
          baseBorder.copyWith(borderSide: const BorderSide(color: Colors.red)),
    );
  }

  @override
  CardTheme get card => const CardTheme();

  @override
  ThemeData get data {
    return ThemeData.light().copyWith(
      primaryColor: primaryColor,
      appBarTheme: appBar,
      buttonTheme: button,
      elevatedButtonTheme: elevatedButton,
      outlinedButtonTheme: outlinedButton,
      inputDecorationTheme: inputDecoration,
      dividerColor: dividerColor,
      cardTheme: card,
      colorScheme: scheme,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: Dimens.dp32,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
          color: licorice,
        ),
        displayMedium: TextStyle(
          fontSize: Dimens.dp18,
          fontWeight: FontWeight.w700,
          fontFamily: 'Inter',
          color: comet,
        ),
        bodyMedium: TextStyle(
          fontSize: Dimens.dp12,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: ghost,
        ),
        bodyLarge: TextStyle(
          fontSize: Dimens.dp14,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: comet,
        ),
      ),
    );
  }
}
