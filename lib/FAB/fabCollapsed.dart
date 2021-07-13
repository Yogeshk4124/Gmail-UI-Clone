import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../DarkTheme.dart';
import '../styles.dart';

Widget buildCollapsedFAB(context) {
  final themeChange = Provider.of<DarkThemeProvider>(context);

  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    curve: Curves.linear,
    width: 50,
    height: 50,
    child: FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, '/compose');
      },
      splashColor: Styles.themeData(themeChange.darkTheme, context).splashColor,
      backgroundColor:
          Styles.themeData(themeChange.darkTheme, context).buttonColor,
      icon: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Icon(Icons.edit, color: Colors.red),
      ),
      label: SizedBox(),
    ),
  );
}
