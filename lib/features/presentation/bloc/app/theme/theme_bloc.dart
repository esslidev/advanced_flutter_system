import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/app_theme.dart';
import '../../../../../core/constants/shared_preference_keys.dart';
import '../../../../../core/enums/theme_enums.dart';
import '../../../../../core/util/prefs_util.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(const AppThemeInitial()) {
    _initializeTheme();
    on<UpdateTheme>(onUpdateTheme);
  }

  void _initializeTheme() async {
    print('Congrats it is initialized successfully!!');
    final savedTheme = PrefsUtil.getString(PrefsKeys.themeStyle);
    final theme = savedTheme == ThemeStyle.light.toString()
        ? ThemeStyle.light
        : ThemeStyle.dark;
    add(UpdateTheme(theme));
  }

  void onUpdateTheme(UpdateTheme event, Emitter<AppThemeState> emit) async {
    emit(const AppThemeInitial());
    if (event.themeStyle == ThemeStyle.light) {
      PrefsUtil.setString(PrefsKeys.themeStyle, event.themeStyle as String);
      emit(AppThemeUpdated(AppTheme.light));
    } else {
      emit(AppThemeUpdated(AppTheme.dark));
    }
  }
}
