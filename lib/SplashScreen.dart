import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gmail/Pages/HomePage.dart';
import 'package:gmail/styles.dart';
import 'package:provider/provider.dart';

import '../DarkTheme.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);

    return Container(
      alignment: Alignment.center,
      color: Styles.themeData(themeChange.darkTheme, context).primaryColor,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/icon.webp',
              width: MediaQuery.of(context).size.width * .3,
              // height: MediaQuery.of(context).size.height * .5,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.all(14),
              child: Text(
                'Google',
                style: TextStyle(
                    fontFamily: 'Catull',
                    decoration: TextDecoration.none,
                    color: Colors.grey,
                    fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
