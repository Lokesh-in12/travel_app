import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_app/core/themes/colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      // fontFamily: 'Sora',
      scaffoldBackgroundColor: white,
      appBarTheme:
          const AppBarTheme(backgroundColor: white, foregroundColor: black),
      textTheme: TextTheme(
        titleLarge: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w300),
        titleMedium: TextStyle(
            fontSize: 15.sp, fontWeight: FontWeight.w300, color: black),
        titleSmall: TextStyle(
            fontSize: 13.sp, fontWeight: FontWeight.w300, color: black),
        displayLarge: TextStyle(
            fontSize: 35.sp, fontWeight: FontWeight.w600, color: black),
        displayMedium:
            TextStyle(fontSize: 15.sp, fontFamily: 'Montserrat', color: black),
        displaySmall: TextStyle(fontSize: 5.sp, color: black),
        bodyLarge: TextStyle(
            fontSize: 30.sp,
            fontWeight: FontWeight.w500,
            color: black,
            fontFamily: 'Montserrat'),
        bodySmall: TextStyle(
            fontSize: 12.sp,
            color: black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'),
        labelSmall: TextStyle(
            fontSize: 11.sp,
            color: black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'),
        labelMedium: TextStyle(
            fontSize: 14.sp,
            color: black,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'),
        headlineLarge: TextStyle(
            fontSize: 40.sp,
            color: white,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat'),
        headlineMedium: TextStyle(
          fontSize: 30.sp,
          color: white,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          fontSize: 20.sp,
          color: white,
          fontWeight: FontWeight.w600,
        ),
      ));
}
