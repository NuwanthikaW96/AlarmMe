import 'package:flutter/material.dart';
import 'Interfaces/Home.dart';
import 'Interfaces/LoginInterface/Login.dart';
import 'Interfaces/RegisterInterface/Register.dart';

import 'Constatnts/MainTheme.dart';
import 'Interfaces/SplashScreen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MainTheme.buildLightTheme(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,

      routes: <String,WidgetBuilder>{
        '/Home' : (BuildContext context) => new Home(user: null,),
        '/Login' : (BuildContext context) => new Login(),
        '/Register' : (BuildContext context) => new Register(),
        // '/Settings' : (BuildContext context) => new Settings(),
        // '/Help' : (BuildContext context) => new Help(),
        // '/Profile' : (BuildContext context) => new Profile(),
      },
    );
  }
}

