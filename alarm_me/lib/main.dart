import 'package:alarm_me_login/Setup/welcome.dart';
import 'package:flutter/material.dart' show BuildContext, Colors, MaterialApp, StatelessWidget, ThemeData, Widget, runApp;

import 'Setup/sign_in.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:  ThemeData(


        primarySwatch: Colors.blue,
      ),
      home:  WelcomePage(),
    );
  }
}


