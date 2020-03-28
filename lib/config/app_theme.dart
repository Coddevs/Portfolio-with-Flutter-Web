import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme(context) {
    return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blue,
      primaryColor: Colors.white,
      accentColor: Colors.blue,
      disabledColor: Colors.grey,
      cardColor: Colors.white,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.light(),
        buttonColor: Colors.blue,
        splashColor: Colors.white,
      ),
    );
  }

  static ThemeData darkTheme(context) {
    return ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.blue,
      primaryColor: Colors.black,
      accentColor: Colors.blue,
      disabledColor: Colors.grey,
      cardColor: Color(0xff1f2124),
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
        colorScheme: ColorScheme.dark(),
        buttonColor: Colors.blue,
        splashColor: Colors.black,
      ),
    );
  }
}
