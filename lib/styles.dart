import 'dart:ui';

import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Color(0xff222222) : Colors.white,
      accentColor: isDarkTheme ? Colors.grey.shade800 : Colors.grey.shade800,
      highlightColor: isDarkTheme ? Colors.grey.shade100 : Colors.grey.shade800,
      secondaryHeaderColor: isDarkTheme ? Colors.white : Colors.black,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      indicatorColor: isDarkTheme ? Color(0xff303030) : Colors.grey.shade100,
      backgroundColor: isDarkTheme ? Color(0xff181818) : Colors.white,
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      bottomAppBarColor: isDarkTheme ? Color(0xff222222) : Colors.white,
      hintColor: isDarkTheme ? Colors.grey : Colors.grey,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
