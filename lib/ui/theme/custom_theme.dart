import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.green,

        )
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Montserrat',
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          buttonColor: Colors.green,
        )
    );
  }
}