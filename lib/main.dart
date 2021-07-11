import 'package:flutter/material.dart';
import 'package:gmail/Pages/MailPage.dart';

import 'Pages/Compose.dart';
import 'Pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'ProductSans'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/compose': (context) => Compose(),
        MailPage.routeName: (context) => MailPage(),
      },
    );
  }
}
