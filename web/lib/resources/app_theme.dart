import 'package:flutter/material.dart';
import 'package:furniture_shop/resources/app_colors.dart';

abstract class AppTheme {
  static ThemeData getTheme(AppThemeType type) {
    // Need to choose proper color values and insert in Theme data
    switch (type) {
      case AppThemeType.light:
        break;
    }

    const colorTheme = ColorScheme.light(
      primary: AppColors.primaryText,
    );

    const textTheme = TextTheme(
      // H1
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 22,
        color: AppColors.primaryText,
        height: 30 / 22,
      ),
      // H2
      headlineMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.primaryText,
        height: 26 / 20,
      ),
      // Body Bold
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: AppColors.primaryText,
        height: 22 / 18,
      ),
      // Body Regular
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
        color: AppColors.primaryText,
        height: 22 / 18,
      ),
      // Body Small Regular
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.primaryText,
        height: 20 / 16,
      ),
    );

    return ThemeData(
      colorScheme: colorTheme,
      primaryColor: AppColors.primaryText,
      textTheme: textTheme,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(horizontal: 32, vertical: 20)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        textStyle: textTheme.bodyLarge,
        primary: AppColors.primaryText,
      )),
    );
  }
}

enum AppThemeType {
  light,
}
