
import 'dart:async';

import './landingscreen.dart';
import 'package:flutter/material.dart';

class welcomescreen extends StatefulWidget {
  const welcomescreen({Key? key}) : super(key: key);

  @override
  _welcomescreenState createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
   late Timer _timer;

  @override
  void initState(){
    final _timer = Timer(const Duration(milliseconds: 4000),() {
      //navigate to the next window
    Navigator.of(context).pushReplacementNamed(landindscreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wspic.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

}
