import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:alarm_me/MyApp.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Inital extends StatefulWidget {
  @override
  _InitalState createState() => _InitalState();
}

class _InitalState extends State<Inital> {
  String latitude = "-1";
  String longitude = "-1";
  String check = "Still Waiting";
  LatLng ourLocation = new LatLng(-1, -1);

  bool checkIfArrived(LatLng yourLocation, LatLng setLocation) {
    double yLat = double.parse(yourLocation.latitude.toStringAsFixed(3));
    double yLon = double.parse(yourLocation.longitude.toStringAsFixed(3));
    double sLat = double.parse(setLocation.latitude.toStringAsFixed(3));
    double sLon = double.parse(setLocation.longitude.toStringAsFixed(3));

    if ((yLat == sLat) && (yLon == sLon))
      return true;
    else
      return false;
  }

  @override
  void initState() {
    super.initState();

    BackgroundLocation.startLocationService();
    BackgroundLocation.getLocationUpdates((location) {
      setState(() {
        this.latitude = location.latitude.toString();
        this.longitude = location.longitude.toString();
        ourLocation = LatLng(double.parse(latitude), double.parse(longitude));
      });

      print("""\n
      Latitude:  $latitude
      Longitude: $longitude
    
      """);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
    );
  }
}
