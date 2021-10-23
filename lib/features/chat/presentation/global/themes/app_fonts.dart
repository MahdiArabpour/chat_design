import 'package:flutter/material.dart';

import 'app_themes.dart';

class AppFonts {
  // change this to IRANSans when english language and fonts added
  static const IRANSans = "IRANSansFaNum";
  static const IRANSansFaNum = "IRANSansFaNum";

  static final textTheme = TextTheme(
    headline1: const TextStyle(
      //**********
      fontSize: 48,
      fontWeight: MyFontWeight.medium,
      // color: AppThemes.primaryColor,
    ).withZoomFix,
    headline3: const TextStyle(
      //************
      fontSize: 29,
      fontWeight: MyFontWeight.light,
    ).withZoomFix,
    headline4: const TextStyle(
      // *************
      fontSize: 25,
      fontWeight: MyFontWeight.medium
      // color: AppThemes.primaryColor,
    ).withZoomFix,
    headline5: const TextStyle(
      //**************
      fontSize: 20,
      fontWeight: MyFontWeight.medium,
    ).withZoomFix,
    subtitle1: const TextStyle(
      //****************
      fontSize: 14.9,
      fontWeight: MyFontWeight.medium,
    ).withZoomFix,
    subtitle2: const TextStyle(
      //*************
      fontSize: 13.1,
      fontWeight: MyFontWeight.medium,
    ).withZoomFix,
    bodyText1: const TextStyle(
      //***************
      fontSize: 14.9,
      fontWeight: MyFontWeight.medium,
      height: 1.6,
    ).withZoomFix,
    bodyText2: const TextStyle(
      // *************
      fontSize: 13.1,
      fontWeight: MyFontWeight.light,
      height: 1.5,
    ).withZoomFix,
    button: const TextStyle(
      // ***********
      fontSize: 16.5,
      fontWeight: MyFontWeight.medium,
    ).withZoomFix,
    caption: const TextStyle(
      //************
      fontSize: 11.7,
      fontWeight: MyFontWeight.light,
    ).withZoomFix,
    overline: const TextStyle(
      // **************
      fontSize: 13.1,
      fontWeight: MyFontWeight.bold,
    ).withZoomFix,
  );
}

abstract class MyFontWeight {
  static const ultraLight = FontWeight.w200;
  static const light = FontWeight.w300;
  static const regular = FontWeight.w400;
  static const medium = FontWeight.w500;
  static const bold = FontWeight.w700;
  static const black = FontWeight.w900;
}

extension on TextStyle {
  /// https://github.com/flutter/flutter/issues/65526
  TextStyle get withZoomFix => copyWith(wordSpacing: 0);
}