import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkTheme.dart';
import '../styles.dart';

Widget buildExtendedFAB(context) {
  final themeChange = Provider.of<DarkThemeProvider>(context);

  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    curve: Curves.linear,
    width: 150,
    height: 50,
    child: FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, '/compose');
      },
      splashColor: Styles.themeData(themeChange.darkTheme, context).errorColor,
      backgroundColor:
          Styles.themeData(themeChange.darkTheme, context).buttonColor,
      icon: Icon(
        Icons.edit,
        color: Colors.red,
      ),
      label: Center(
        child: Text(
          "Compose",
          style: TextStyle(fontSize: 15, color: Colors.red),
        ),
      ),
    ),
  );
}
