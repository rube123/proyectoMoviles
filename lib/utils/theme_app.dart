import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData darkTheme() {
    final theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.grey,
        onPrimary: Colors.amber,
        secondary: Colors.black12,
        onSecondary: Colors.red,
        error: Colors.red,
        onError: Colors.red,
        surface: Colors.orange,
        onSurface: Colors.green,
      ),
    );
    return theme;
  }

  static ThemeData lightTheme() {
    final theme = ThemeData.light().copyWith(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.blue,
        onPrimary: Colors.white,
        secondary: Colors.amber,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
    );
    return theme;
  }
}
