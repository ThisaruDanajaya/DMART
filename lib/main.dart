import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifier/food_notifier.dart';
import 'pages/log/landingpage.dart';
import 'pages/log/welcomescreen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) { builder:(context)=> FoodNotifier(); },
      ),
    ],
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DMART',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primarySwatch: Colors.deepPurple,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
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
