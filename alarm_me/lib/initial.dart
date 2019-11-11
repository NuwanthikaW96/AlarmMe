import 'package:alarm_me/Interfaces/Interfaces/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'Constatnts/MainTheme.dart';
import 'Constatnts/c.dart';
import 'Interfaces/Interfaces/Home.dart';
import 'Interfaces/Interfaces/LoginInterface/Login.dart';
import 'Interfaces/Interfaces/RegisterInterface/Register.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm Me',
      theme: MainTheme.buildLightTheme(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,

      routes: <String,WidgetBuilder>{
        '/Home' : (BuildContext context) => new Home(user: C.user),
        '/Login' : (BuildContext context) => new Login(),
        '/Register' : (BuildContext context) => new Register(),
        // '/Settings' : (BuildContext context) => new Settings(),
        // '/Help' : (BuildContext context) => new Help(),
        // '/Profile' : (BuildContext context) => new Profile(),
      },
    );
  }
}

