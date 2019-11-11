import 'package:cloud_firestore/cloud_firestore.dart';

class MapProxy {
  GeoPoint location;

  MapProxy(GeoPoint location) {
    this.location = location;
  }

  void update(GeoPoint currLatLon) {
    int _precision = 3;
    double _latitude = double.parse(location.latitude.toStringAsFixed(_precision));
    double _longtitude = double.parse(location.longitude.toStringAsFixed(_precision));
    double _currentLatitude = double.parse(currLatLon.latitude.toStringAsFixed(_precision));
    double _currentLongtitude = double.parse(currLatLon.longitude.toStringAsFixed(_precision));
    if ((_latitude == _currentLatitude) && (_longtitude == _currentLongtitude)){

      

    }
  }
}
