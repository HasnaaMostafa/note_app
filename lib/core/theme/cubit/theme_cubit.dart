import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dark_theme.dart';
import '../light_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  static const String themeKey = 'themeKey';
  final SharedPreferences _preferences;

  ThemeCubit(this._preferences)
      : super(
          _preferences.containsKey(themeKey)
              ? _getThemeData(_preferences.getString(themeKey)!)
              : LightTheme.getTheme(),
        );

  void toggleTheme() {
    emit(state == LightTheme.getTheme()
        ? DarkTheme.getTheme()
        : LightTheme.getTheme());
    _preferences.setString(
        themeKey, state == LightTheme.getTheme() ? 'light' : 'dark');
  }

  static ThemeData _getThemeData(String themeValue) {
    return themeValue == 'dark' ? DarkTheme.getTheme() : LightTheme.getTheme();
  }
}
