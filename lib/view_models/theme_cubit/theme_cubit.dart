import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenges_acceptance/utils/app_theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeStateLight());

  void toggleTheme() {
    if (state is ThemeStateLight) {
      emit(ThemeStateDark());
    } else {
      emit(ThemeStateLight());
    }
  }
}
