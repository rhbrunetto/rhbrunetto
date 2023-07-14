import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import 'colors.dart';

class JobSiteThemeData {
  const JobSiteThemeData._({
    required this.backgroundColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.brightness,
    required this.dividerColor,
    required this.highlightColor,
  });

  const JobSiteThemeData.dark()
      : this._(
          brightness: Brightness.light,
          backgroundColor: JobSiteColors.white,
          primaryTextColor: JobSiteColors.greyishBlueDarkest,
          secondaryTextColor: JobSiteColors.greyishBlueLight,
          dividerColor: JobSiteColors.turquoise,
          highlightColor: JobSiteColors.turquoiseDark,
        );

  final Color backgroundColor;
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Brightness brightness;
  final Color dividerColor;
  final Color highlightColor;

  TextStyle get _baseTextStyle => TextStyle(
        height: 1.25,
        color: primaryTextColor,
        fontFamily: FontFamily.lato,
      );

  ThemeData toMaterialTheme() => ThemeData(
        brightness: brightness,
        splashColor: Colors.transparent,
        hoverColor: JobSiteColors.white,
        fontFamily: FontFamily.lato,
        textTheme: TextTheme(
          displayLarge: _baseTextStyle.copyWith(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: _baseTextStyle.copyWith(
            fontSize: 42,
            fontWeight: FontWeight.w600,
          ),
          displaySmall: _baseTextStyle.copyWith(
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: _baseTextStyle.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: _baseTextStyle.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: _baseTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: _baseTextStyle.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          labelLarge: _baseTextStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
        colorScheme: ColorScheme.light(
          brightness: brightness,
          primary: JobSiteColors.greyishBlueDarkest,
          secondary: JobSiteColors.greyishBlueLight,
          background: backgroundColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          titleTextStyle: _baseTextStyle.copyWith(
            fontSize: 17,
            color: primaryTextColor,
            fontWeight: FontWeight.bold,
            letterSpacing: .23,
          ),
          foregroundColor: primaryTextColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: JobSiteColors.turquoiseDark,
            textStyle: _baseTextStyle.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        canvasColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        highlightColor: JobSiteColors.turquoiseDark,
        hintColor: JobSiteColors.turquoiseDark,
        dividerColor: dividerColor,
      );
}
