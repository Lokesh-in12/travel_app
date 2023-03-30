import 'package:flutter/material.dart';
import 'package:travel_app/core/themes/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      // fontFamily: 'Sora',
      scaffoldBackgroundColor: white,
      appBarTheme:
          const AppBarTheme(backgroundColor: white, foregroundColor: black),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.w300),
        titleMedium:
            TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: black),
        titleSmall:
            TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: black),
        displayLarge:
            TextStyle(fontSize: 40, fontWeight: FontWeight.w600, color: black),
        displayMedium:
            TextStyle(fontSize: 25, fontFamily: 'Montserrat', color: black),
        displaySmall: TextStyle(fontSize: 5, color: black),
        bodyLarge: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
            color: black,
            fontFamily: 'Montserrat'),
        bodySmall: TextStyle(
            fontSize: 15,
            color: black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'),
        labelSmall: TextStyle(
            fontSize: 13,
            color: black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'),
        labelMedium: TextStyle(
            fontSize: 18,
            color: black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'),
        headlineLarge: TextStyle(
            fontSize: 40,
            color: white,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat'),
        headlineMedium: TextStyle(
          fontSize: 30,
          color: white,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          color: white,
          fontWeight: FontWeight.w600,
        ),
      ));
}
