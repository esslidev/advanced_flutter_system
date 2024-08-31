import '../../../../../core/enums/theme_enums.dart';

abstract class AppThemeEvent {
  const AppThemeEvent();
}

class UpdateTheme extends AppThemeEvent {
  final ThemeStyle themeStyle;

  const UpdateTheme(this.themeStyle);
}
