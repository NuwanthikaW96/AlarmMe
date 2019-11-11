import 'package:alarm_me/Classes/Alarm.dart';
import 'package:alarm_me/Interfaces/Layout/BaseAlertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AlarmInterfaceHandler {
  final db = Firestore.instance;
  final Alarm alarm;

  AlarmInterfaceHandler({this.alarm});

  //setLocation function should call here
  Future editLocation(BuildContext context, String uid, GeoPoint geoPoint,
      String name, String reminder, bool enabled) async {
    //Here we should write the firebase code to enter this alarm to the firebase
    if (_checkNameAndReminderEmpty(name, reminder)) {
      try {
        await db.collection('Alarms').document(alarm.getDid).updateData({
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
            content: "Your Location Alarm is Edited Successfully!",
            yesOnPressed: () {
              Navigator.pop(context);
              Navigator.of(context).pushNamed('/Home');
            },
          ),
        );
      } catch (e) {
        print(e.message);
        Fluttertoast.showToast(
            msg: e.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 3,
            backgroundColor: Colors.red[2000],
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } else {
      showDialog(
        context: context,
        child: BaseAlertDialog(
          yes: "OK",
          title: "Fields are Empty",
          content: "Name or Remider Field is Empty.\nPlease Fill them and Try Again!",
          yesOnPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    }
  }

  Future deleteAlarm(BuildContext context) async {
    try {
      await db.collection('Alarms').document(alarm.getDid).delete();
      showDialog(
        context: context,
        child: BaseAlertDialog(
          yes: "OK",
          title: "Deleted Successfully",
          content: "Your Location Alarm is Deleted Successfully!",
          yesOnPressed: () {
            Navigator.of(context).pushNamed('/Home');
          },
        ),
      );
    } catch (e) {
      print(e.message);
      Fluttertoast.showToast(
          msg: e.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 3,
          backgroundColor: Colors.red[2000],
          textColor: Colors.white,
          fontSize: 16.0);
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
}

//and here we should have functions as well to check if the alarm name and reminder text(if enabled) is null
//we also write a function to delte the alarm as well
//and call the all the interface handelers as I done here **
