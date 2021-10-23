import 'package:chat_design/features/chat/presentation/global/themes/app_fonts.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static const primaryColor = Color(0xfff63e01);
  static const primaryVariant = Color(0xffac2f06);
  static const accentColor = Color(0xfffebb95);
  static const secondaryVariant = Color(0xffe79d73);
  static const errorColor = Color(0xfffa675c);
  static const backgroundColor = Color(0xfffefcf0);
  static const scaffoldBackgroundColor = backgroundColor;

  static ThemeData _baseTheme({
    Brightness brightness = Brightness.light,
    bool persianFont = true,
  }) =>
      ThemeData(
        brightness: brightness,
        colorScheme: ColorScheme(
          primary: primaryColor,
          primaryVariant: primaryVariant,
          secondary: accentColor,
          secondaryVariant: secondaryVariant,
          surface: scaffoldBackgroundColor,
          background: backgroundColor,
          error: errorColor,
          onPrimary: Colors.white,
          onSecondary: Colors.black,
          onSurface: primaryColor,
          onBackground: primaryColor,
          onError: Colors.white,
          brightness: brightness,
        ),
        textTheme: AppFonts.textTheme,
        shadowColor: accentColor,
        errorColor: errorColor,
        backgroundColor: backgroundColor,
        disabledColor: backgroundColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        splashColor: Colors.black12,
        canvasColor: scaffoldBackgroundColor,
      );

  /// light theme
  static ThemeData light = _baseTheme();

  static ThemeData englishTheme = _baseTheme(
    persianFont: false,
  );

  /// dark theme
  static ThemeData dark = _baseTheme(
    brightness: Brightness.dark,
  );
}
