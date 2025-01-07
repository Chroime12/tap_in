import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: Colors.teal,
    hintColor: Colors.amber,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.teal),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.teal,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey[900],
    hintColor: Colors.teal,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.teal,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
