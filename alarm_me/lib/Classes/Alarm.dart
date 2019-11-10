import 'MapProxy.dart';

import 'Location.dart';

class Alarm {
  String alarmName;
  String reminderText;
  bool enabled;

  Alarm(String alarmName,double longitude,double latitude,String reminderText,bool enabled) {
    this.alarmName=alarmName;
    Location loc=Location(longitude,latitude);
    MapProxy proxy=MapProxy(loc);
    this.enabled=enabled;
    this.reminderText=reminderText;
    if (enabled) {
      enable();
    }
  }

  void changeEnabled() {
    enabled=!enabled;
    if (enabled) {
      enable();
    } else {
      disable();
    }
  }

  void enable() {
    //TODO add to map listeners
  }

  void disable() {
    //TODO remove from listeners
  }
}