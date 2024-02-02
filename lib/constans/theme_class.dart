import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    primaryColor: const Color(0xffF5F5F5),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.black),
    ),
    primaryColorDark: Colors.transparent,
    cardColor: Colors.black,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(color: Colors.white),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    primaryColorDark: Colors.transparent,
    primaryColor: const Color(0xff1A1A1A),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
    ),
    cardColor: Colors.white
  );
}
