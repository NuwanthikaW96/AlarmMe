import 'MapProxy.dart';

import 'Location.dart';

class Alarm {
  String reminderText;
  bool enabled;

  Alarm(double longitude,double latitude,String reminderText,bool enabled) {
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