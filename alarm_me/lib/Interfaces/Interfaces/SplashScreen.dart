import 'dart:async';
import 'package:alarm_me/Constatnts/c.dart';
import 'package:flutter/material.dart';

import 'LoginInterface/Login.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) =>
                 Login(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.textColour,
      body: Center(
        child: Image.asset(C.imageLink + 'logo.png'),
      ),
    );
  }
}
