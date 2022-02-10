import 'package:final_projrct/tabs/log/landingscreen.dart';
import 'package:final_projrct/tabs/log/loginp.dart';
import 'package:flutter/material.dart';

import 'tabs/log/landingpage.dart';
import 'tabs/log/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DMART',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),

            backgroundColor: MaterialStateProperty.all(
              Colors.deepPurpleAccent
            ),
            elevation: MaterialStateProperty.all(0),

          ),
        ),
      ),
      home: welcomescreen(),
      routes: {
        LandingPage.routeName: (context) => LandingPage(),
      },
    );
  }
}
