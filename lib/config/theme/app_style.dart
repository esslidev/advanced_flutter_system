import 'package:flutter/material.dart';

import '../../core/constants/app_theme.dart';

class AppStyle {
  // Add more text styles as needed...
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppTheme.light.primary1, // Set your primary color
    fontFamily: 'analogue-reduced',
    scaffoldBackgroundColor: AppTheme.light.scaffoldBackgroundColor,
  );

  static TextStyle headline = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppTheme.light.headline,
  );

  static TextStyle headline2 = TextStyle(
    fontWeight: FontWeight.w500,
    color: AppTheme.light.headline2,
  );

  static TextStyle bodyText =
      TextStyle(color: AppTheme.light.bodyText, fontWeight: FontWeight.w400);
}
