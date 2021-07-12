import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Color(0xff222222) : Colors.white,
      accentColor: isDarkTheme ? Colors.grey.shade100 : Colors.grey.shade800,
      secondaryHeaderColor: isDarkTheme ? Colors.white : Colors.black87,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      backgroundColor: isDarkTheme ? Color(0xff181818) : Colors.white,
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      bottomAppBarColor: isDarkTheme ? Color(0xff222222) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Colors.grey : Colors.grey,
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
