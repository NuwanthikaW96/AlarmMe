import 'package:alarm_me/Classes/Alarm.dart';
import 'package:alarm_me/Classes/AlarmTone.dart';
import 'package:alarm_me/Interfaces/Layout/BaseAlertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmLibrary {
  static List<Alarm> _alarms = new List<Alarm>();

  static void addAlarm(Alarm alarm) {
    if (!_alarms.contains(alarm)) {
      _alarms.add(alarm);
    }
  }

  static List<Alarm> getAlarms() {
    return _alarms;
  }

  static void deleteAlarm(Alarm alarm) {
    _alarms.remove(_alarms.indexOf(alarm));
  }

  static void updateAlarm(Alarm oldAlarm, Alarm newAlarm) {
    _alarms[_alarms.indexOf(oldAlarm)] = newAlarm;
  }

  static void check(GeoPoint current, GlobalKey<ScaffoldState> context) {
    int _precision = 3;
    double cLat = double.parse(current.latitude.toStringAsFixed(_precision));
    double cLon = double.parse(current.longitude.toStringAsFixed(_precision));
    int i = 0;

    while(i<_alarms.length){
      double sLat = double.parse(_alarms[i].geoPoint.latitude.toStringAsFixed(_precision));
      double sLon = double.parse(_alarms[i].geoPoint.longitude.toStringAsFixed(_precision));
      if ((cLat == sLat) && (cLon == sLon) && (_alarms[i].enabled == true)) {
        _updateTheAlarmToFirebase(_updateTheEnableAlarm(_alarms[i]));
        _alarms[i] = _updateTheEnableAlarm(_alarms[i]);
       // updateAlarm(alarm, _updateTheEnableAlarm(alarm));
        AlarmTone _alarmTone = new AlarmTone(_alarms[i].getReminder);
        _alarmTone.open();
        showDialog(
          context: context.currentContext,
          child: BaseAlertDialog(
            yes: "OK",
            title: "You Have Arrived",
            content:
                "Alarm Name : "+_alarms[i].getName+"\nLatitude : "+_alarms[i].geoPoint.latitude.toString()+"\nLongitude : "+_alarms[i].geoPoint.longitude.toString()+"\nReminder Text : "+_alarms[i].getReminder,
            yesOnPressed: () {
              _alarmTone.stop();
              Navigator.of(context.currentContext).pop();
            },
          ),
        );
      }
      i++;
    }



    // _alarms.forEach((alarm) async {
    //   double sLat = double.parse(alarm.geoPoint.latitude.toStringAsFixed(_precision));
    //   double sLon = double.parse(alarm.geoPoint.longitude.toStringAsFixed(_precision));
    //   if ((cLat == sLat) && (cLon == sLon) && (alarm.enabled == true)) {
    //     await _updateTheAlarmToFirebase(_updateTheEnableAlarm(alarm));
    //     _alarms[i] = _updateTheEnableAlarm(alarm);
    //    // updateAlarm(alarm, _updateTheEnableAlarm(alarm));
    //     AlarmTone _alarmTone = new AlarmTone(alarm.getReminder);
    //     _alarmTone.open();
    //     showDialog(
    //       context: context.currentContext,
    //       child: BaseAlertDialog(
    //         yes: "OK",
    //         title: "You Have Arrived",
    //         content:
    //             "Alarm Name : "+alarm.getName+"\nLatitude : "+alarm.geoPoint.latitude.toString()+"\nLongitude : "+alarm.geoPoint.longitude.toString()+"\nReminder Text : "+alarm.getReminder,
    //         yesOnPressed: () {
    //           _alarmTone.stop();
    //           Navigator.of(context.currentContext).pop();
    //         },
    //       ),
    //     );
    //   }
    //   i++;
    // });
  
  
  }

  static Alarm _updateTheEnableAlarm(Alarm alarm){
    return new Alarm(
      dId: alarm.getDid,
      enabled: false,
      geoPoint: alarm.geoPoint,
      name: alarm.getName,
      reminder: alarm.reminder,
      uid: alarm.uid
    );
  }

  static void _updateTheAlarmToFirebase(Alarm alarm) async{
    await Firestore.instance.collection('Alarms').document(alarm.getDid).updateData({
          'enabled': false,
        });
  }
}
