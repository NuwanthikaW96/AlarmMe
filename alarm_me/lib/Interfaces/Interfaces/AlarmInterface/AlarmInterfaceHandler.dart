import 'package:alarm_me/Interfaces/Layout/BaseAlertDialog.dart';
import 'package:flutter/material.dart';


class AlarmInterfaceHandler{
  
  //setLocation function should call here
  void setLocation(BuildContext context){
    //Here we should write the firebase code to enter this alarm to the firebase
    showDialog(
      context: context,
      child: BaseAlertDialog(
        yes: "OK",
        title: "Location is Set",
        content: "Your Location Alarm is Set!",
        yesOnPressed: (){
          Navigator.of(context).pushNamed('/Home');
        },
      ),
    );
  }

  //and here we should have functions as well to check if the alarm name and reminder text(if enabled) is null
  //we also write a function to delte the alarm as well
  //and call the all the interface handelers as I done here **

}