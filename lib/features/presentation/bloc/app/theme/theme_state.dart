import 'package:equatable/equatable.dart';

abstract class AppThemeState extends Equatable {
  final Object? theme;
  const AppThemeState({this.theme});

  @override
  List<Object?> get props => [theme];
}

class AppThemeInitial extends AppThemeState {
  // Pass a default value or handle as needed.
  const AppThemeInitial();
}

class AppThemeUpdated extends AppThemeState {
  const AppThemeUpdated(Object theme) : super(theme: theme);
}
