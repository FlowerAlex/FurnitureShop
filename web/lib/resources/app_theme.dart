import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData getTheme(AppThemeType type) {
    // Need to choose proper color values and insert in Theme data
    switch (type) {
      case AppThemeType.light:
        break;
    }

    return ThemeData(
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
    );
  }
}

enum AppThemeType {
  light,
}
