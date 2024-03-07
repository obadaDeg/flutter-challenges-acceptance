part of 'theme_cubit.dart';

abstract class ThemeState {
  final ThemeData themeData;

  const ThemeState(this.themeData);
}

class ThemeStateLight extends ThemeState {
  ThemeStateLight() : super(AppTheme.lightTheme());
}

class ThemeStateDark extends ThemeState {
  ThemeStateDark() : super(AppTheme.darkTheme());
}
