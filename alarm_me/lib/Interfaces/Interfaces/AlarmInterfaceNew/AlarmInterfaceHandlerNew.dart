import 'package:alarm_me/Classes/Alarm.dart';
import 'package:alarm_me/Interfaces/Layout/BaseAlertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AlarmInterfaceHandler {
  final db = Firestore.instance;
  final Alarm alarm;

  AlarmInterfaceHandler({this.alarm});

  //setLocation function should call here
  Future setLocation(BuildContext context, String uid, GeoPoint geoPoint,
      String name, String reminder, bool enabled) async {
    //Here we should write the firebase code to enter this alarm to the firebase
    if (_checkNameAndReminderEmpty(name, reminder)) {
      try {
        await db.collection('Alarms').add({
          'UID': uid,
          'Name': name,
          'location': geoPoint,
          'reminder': reminder,
          'enabled': enabled
        });
        showDialog(
          context: context,
          child: BaseAlertDialog(
            yes: "OK",
            title: "Location is Set",
            content: "Your Location Alarm is Set!",
            yesOnPressed: () {
              Navigator.of(context).pushNamed('/Home');
            },
          ),
        );
      } catch (e) {
        print(e.toString());
      }
    }
  else {
      showDialog(
        context: context,
        child: BaseAlertDialog(
          yes: "OK",
          title: "Fields are Empty",
          content:
              "Name or Remider Field is Empty.\nPlease Fill them and Try Again!",
          yesOnPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  bool _checkNameAndReminderEmpty(String name, String reminder) {
    if (((name == "") || (name == null)) &&
        ((reminder == "") || (reminder == null))) {
      return false;
    } else {
      return true;
    }
  }

  //and here we should have functions as well to check if the alarm name and reminder text(if enabled) is null
  //we also write a function to delte the alarm as well
  //and call the all the interface handelers as I done here **

}
