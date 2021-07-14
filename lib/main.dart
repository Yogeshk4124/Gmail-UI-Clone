import 'package:flutter/material.dart';
import 'package:gmail/styles.dart';
import 'package:provider/provider.dart';

import '../DarkTheme.dart';
import 'Pages/Compose.dart';
import 'Pages/HomePage.dart';
import 'Pages/MailPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return MaterialApp(
            title: 'Gmail UI Clone',
            // theme: ThemeData(
            //     primarySwatch: Colors.blue, fontFamily: 'ProductSans'),
            debugShowCheckedModeBanner: false,

            theme: Styles.themeData(themeChangeProvider.darkTheme, context),
            initialRoute: '/',
            routes: {
              '/': (context) => HomePage(),
              '/compose': (context) => Compose(),
              MailPage.routeName: (context) => MailPage(),
            },
          );
        },
      ),
    );
  }
}
