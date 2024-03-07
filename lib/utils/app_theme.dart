import 'package:flutter/material.dart';
import 'package:flutter_challenges_acceptance/utils/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.primary,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        accentColor: AppColors.accent,
      ).copyWith(
        secondary: AppColors.secondary,
        surface: AppColors.surface,
        background: AppColors.background,
        error: AppColors.error,
        onPrimary: AppColors.onPrimary,
        onSecondary: AppColors.onSecondary,
        onSurface: AppColors.onSurface,
        onBackground: AppColors.onBackground,
        onError: AppColors.error,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: AppColors.onBackground),
        bodyText2: TextStyle(color: AppColors.onBackground),
        headline1: TextStyle(color: AppColors.onPrimary),
        headline2: TextStyle(color: AppColors.onPrimary),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grey2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.onBackground,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.primary,
        iconTheme: IconThemeData(color: AppColors.onPrimary),
      ),
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.darkPrimary,
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.deepPurple,
        accentColor: AppColors.darkAccent,
        brightness: Brightness.dark,
      ).copyWith(
        secondary: AppColors.darkSecondary,
        surface: AppColors.darkSurface,
        background: AppColors.darkBackground,
        error: AppColors.darkError,
        onPrimary: AppColors.darkOnPrimary,
        onSecondary: AppColors.darkOnSecondary,
        onSurface: AppColors.darkOnSurface,
        onBackground: AppColors.darkOnBackground,
        onError: AppColors.darkOnError,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(color: AppColors.darkOnBackground),
        bodyText2: TextStyle(color: AppColors.darkOnBackground),
        headline1: TextStyle(color: AppColors.darkOnPrimary),
        headline2: TextStyle(color: AppColors.darkOnPrimary),
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColors.darkPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textTheme: ButtonTextTheme.primary,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.grey2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      iconTheme: IconThemeData(
        color: AppColors.darkOnBackground,
      ),
      appBarTheme: AppBarTheme(
        color: AppColors.darkPrimary,
        iconTheme: IconThemeData(color: AppColors.darkOnPrimary),
      ),
      useMaterial3: true,
    );
  }
}
