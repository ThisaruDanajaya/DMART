import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loging extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/logback.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
