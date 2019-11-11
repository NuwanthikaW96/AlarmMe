import 'package:alarm_me/Classes/Alarm.dart';

class AlarmLibrary{
  static List<Alarm> _alarms = new List<Alarm>();

  static void addAlarm(Alarm alarm){
    if(! _alarms.contains(alarm)) {
      _alarms.add(alarm);
    }
  }

  static List<Alarm> getAlarms(){
    return _alarms;
  }

  static void deleteAlarm(Alarm alarm){
    _alarms.remove(_alarms.indexOf(alarm));
  }

  static void updateAlarm(Alarm oldAlarm,Alarm newAlarm){
    _alarms[_alarms.indexOf(oldAlarm)] = newAlarm;
  }




}