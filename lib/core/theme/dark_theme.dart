import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData getTheme() {
    bool? isDark;
    isDark = true;
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: "Poppins",
      useMaterial3: true,
    );
  }
}
