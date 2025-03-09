import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/cubit/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light));

  void toggleTheme(bool isDark) {
    final newThemeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeState(themeMode: newThemeMode));
  }
}
