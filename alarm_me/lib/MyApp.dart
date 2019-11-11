import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState();

  String latitude = "waiting...";
  String longitude = "waiting...";
  String check = "Still Waiting";


  //LatLng ourLocation;

  bool checkIfArrived(LatLng yourLocation, LatLng setLocation) {
    int precision;
    precision =3;
    double yLat = double.parse(yourLocation.latitude.toStringAsFixed(precision));
    double yLon = double.parse(yourLocation.longitude.toStringAsFixed(precision ));
    double sLat = double.parse(setLocation.latitude.toStringAsFixed(precision ));
    double sLon = double.parse(setLocation.longitude.toStringAsFixed(precision ));

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
     
      LatLng _temp = LatLng(double.parse(latitude), double.parse(longitude));
      if (checkIfArrived(_temp, _pos2.target)) {
        this.check = "Arrived";
      } else {
        this.check = "Still Waiting";
      }
    });

    print("""\n
    Latitude:  $latitude
    Longitude: $longitude
    """);
    });
  }

  GoogleMapController mapController;

  LatLng _center = LatLng(6.79731, 79.90209);

  CameraPosition _pos =
      new CameraPosition(target: LatLng(6.79731, 79.90209), zoom: 13);
  CameraPosition _pos2 =
      new CameraPosition(target: LatLng(6.79731, 79.90209), zoom: 13);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _updatePosition(CameraPosition _position) {
    print(
        'inside updatePosition ${_position.target.latitude} ${_position.target.longitude}');
    Marker marker = _markers.firstWhere((p) => p.markerId == MarkerId('Marker'),
        orElse: () => null);

    _markers.remove(marker);
    _markers.add(
      Marker(
        markerId: MarkerId('Marker'),
        position: LatLng(_position.target.latitude, _position.target.longitude),
        draggable: true,
      ),
    );
    setState(() {
      _pos = _position;
    });
  }

  var _markers = Set<Marker>.of([
    Marker(
        draggable: true,
        position: LatLng(6.79731, 79.90209),
        onTap: () {
          print("asasas");
        },
        markerId: MarkerId('Marker'),
        onDragEnd: ((value) {
          print(value.latitude);
          print(value.longitude);
        })),
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 400,
            width: double.infinity,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              compassEnabled: true,
              markers: _markers,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 19.0,
              ),
              onCameraMove: ((_position) => _updatePosition(_position)),
            ),
          ),
          Divider(
            color: Colors.green[700],
            endIndent: 20,
            indent: 20,
            thickness: 3,
          ),
          RaisedButton(
            child: new Text("Get Map Location!"),
            color: Colors.green[700],
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                _pos2 = _pos;
              });
              LatLng _temp =
                  new LatLng(double.parse(latitude), double.parse(longitude));

              if (checkIfArrived(_temp, _pos2.target)) {
                this.check = "Arrived";
              } else {
                this.check = "Still Waiting";
              }
            },
          ),
          new Text("Latitude :" + _pos2.target.latitude.toString()),
          new Text("Longitude :" + _pos2.target.longitude.toString()),
          new Text("Your Location Lattitude:" + latitude.toString()),
          new Text("Your Location Longitude:" + longitude.toString()),
          new Text(check),
        ],
      ),
    );
  }
}
