import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData getTheme() {
    bool? isDark;
    isDark = false;
    return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Poppins",
      useMaterial3: true,
    );
  }
}
