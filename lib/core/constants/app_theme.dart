import 'package:flutter/material.dart';

class AppTheme {
  static AppColors get colors => AppColors();
  static LightTheme get light => LightTheme();
  static DarkTheme get dark => DarkTheme();
}

class AppColors {
  // Global colors
  final Color whiteSolid = const Color(0xFFFFFFFF);
  final Color whiteAlpine = const Color(0xFFF1F2F7);
  final Color white = const Color(0xFFF8FAFB);
  final Color graySteel = const Color(0xFF7A7A7A);
  final Color blackSatinDeep = const Color(0xFF0E0C18);
  final Color redDevilAdvocate = const Color(0xFFFF313C);
  final Color greenTimeless = const Color(0xFFB2D8D8);
  final Color greenVeranda = const Color(0xFF66B2B2);
  final Color greenTeal = const Color(0xFF008080);
  final Color greenSciFiPetrol = const Color(0xFF006666);
  final Color greenDarkTeal = const Color(0xFF004C4C);
  final Color greenCopperPyrite = const Color(0xFF3C4937);
  final Color pinkTuttiFrutti = const Color(0xFFC0597D);
  final Color blueDecoreSplash = const Color(0xFF00809E);
  final Color greenBlackGraphite = const Color(0xFF324B4B);
  final Color blueCalcite = const Color(0xFF95B1B0);
  final Color purpleKimberlite = const Color(0xFF6470A3);
}

class LightTheme {
  // Light theme colors
  final Color scaffoldBackgroundColor = AppTheme.colors.whiteAlpine;
  final Color primary1 = AppTheme.colors.greenTimeless;
  final Color primary2 = AppTheme.colors.greenVeranda;
  final Color primary3 = AppTheme.colors.greenTeal;
  final Color primary4 = AppTheme.colors.greenSciFiPetrol;
  final Color primary5 = AppTheme.colors.greenDarkTeal;
  final Color headline = AppTheme.colors.greenCopperPyrite;
  final Color headline2 = AppTheme.colors.greenCopperPyrite;
  final Color bodyText = AppTheme.colors.greenCopperPyrite;
}

class DarkTheme {
  // Dark theme colors (you can define these as needed)
  final Color scaffoldBackgroundColor = AppTheme.colors.whiteAlpine;
  final Color primary1 = AppTheme.colors.greenTimeless;
  final Color primary2 = AppTheme.colors.greenVeranda;
  final Color primary3 = AppTheme.colors.greenTeal;
  final Color primary4 = AppTheme.colors.greenSciFiPetrol;
  final Color primary5 = AppTheme.colors.greenDarkTeal;
  final Color headline = AppTheme.colors.greenCopperPyrite;
  final Color headline2 = AppTheme.colors.greenCopperPyrite;
  final Color bodyText = AppTheme.colors.greenCopperPyrite;
}
