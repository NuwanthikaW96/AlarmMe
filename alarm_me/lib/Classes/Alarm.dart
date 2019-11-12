import 'package:cloud_firestore/cloud_firestore.dart';

class Alarm{
  String dId;
  String uid;
  bool enabled;
  GeoPoint geoPoint;
  String name;
  String reminder;

  Alarm({this.dId,this.uid,this.geoPoint,this.enabled,this.name,this.reminder});

  String get getDid{
    return this.dId;
  }

  String get getUid{
    return this.uid;
  }

  bool get getEnabled{
    return this.enabled;
  }

  GeoPoint get getGeoPoint{
    return this.geoPoint;
  }

  String get getName{
    return this.name;
  }

  String get getReminder{
    return this.reminder;
  }
}