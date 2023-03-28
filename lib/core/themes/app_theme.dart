import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      // fontFamily: 'Sora',
      scaffoldBackgroundColor: white,
      appBarTheme:
          const AppBarTheme(backgroundColor: white, foregroundColor: black),
      textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 20, color: black),
          displayMedium: TextStyle(fontSize: 10, color: black),
          displaySmall: TextStyle(fontSize: 5, color: black)));
}
