import 'package:alarm_me/Constatnts/c.dart';
import 'package:alarm_me/Interfaces/Layout/BaseAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Classes/Alarm.dart';
import 'AlarmInterfaceHandlerEdit.dart';

class AlarmInterfaceEdit extends StatefulWidget {
  final Alarm alarm;
  AlarmInterfaceEdit({this.alarm});
  @override
  _AlarmInterfaceStateEdit createState() =>
      _AlarmInterfaceStateEdit(alarm: this.alarm);
}

class _AlarmInterfaceStateEdit extends State<AlarmInterfaceEdit> {
  //** Like this call the interface handlers in each respective pages

  GoogleMapController mapController;

  LatLng _center;

  CameraPosition _pos;
  CameraPosition _pos2;

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
     // _geoPoint = new GeoPoint(_pos.target.latitude, _pos.target.longitude);
    });
  }

  var _markers;

  Alarm alarm;
  AlarmInterfaceHandler _alarmInterfaceHandler;
  TextEditingController _nameController;
  TextEditingController _reminderController;
  bool _temp;
  GeoPoint _geoPoint;

  _AlarmInterfaceStateEdit({this.alarm}) {
    //this.alarm = alarm;
    _geoPoint = alarm.geoPoint;

    this._alarmInterfaceHandler = new AlarmInterfaceHandler(alarm: this.alarm);

    this._nameController = new TextEditingController();
    _nameController.text = alarm.getName;
    this._reminderController = new TextEditingController();
    _reminderController.text = alarm.getReminder;

    this._temp = alarm.getEnabled;
    print(alarm.getDid + "we;owqe;owqk;eewqeqwpeoqpw[eo[pw");

    _center = LatLng(alarm.geoPoint.latitude, alarm.geoPoint.longitude);
    _pos = new CameraPosition(target: _center, zoom: 8);
    _pos2 = new CameraPosition(target: _center, zoom: 8);
    _markers = Set<Marker>.of([
    Marker(
      draggable: true,
      position: _center,
      onTap: () {
        print("asasas");
      },
      markerId: MarkerId('Marker'),
    ),
  ]);


  }

  @override
  Widget build(BuildContext context) {
    bool _temp = alarm.getEnabled;
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new BaseAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _height / 2.5,
              width: _width,
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
              color: C.primaryColour,
              endIndent: 20,
              indent: 20,
              thickness: 3,
            ),
            Center(
              child: SizedBox(
                width: _width / 1.25,
                height: _height / 11,
                child: TextFormField(
                  enabled: this._temp,
                  decoration: new InputDecoration(
                    hintText: "Enter the Alarm Name",
                  ),
                  controller: _nameController,
                  //initialValue: this.alarm.getName,
                ),
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: (_width / 2.5),
                    child: RaisedButton(
                      onPressed: () =>null,
                          //_alarmInterfaceHandler.setLocation(context,),
                      child: Text(
                        'Edit Location',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _width / 24),
                    child: SizedBox(
                      width: _width / 2.5,
                      child: RaisedButton(
                        onPressed: () async {
                          await _alarmInterfaceHandler.deleteAlarm(context);
                          print("object1");
                        },
                        child: Text('Delete'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: C.primaryColour,
              endIndent: 20,
              indent: 20,
              thickness: 3,
            ),
            Center(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text("Enable the alarm"),
                  Switch(
                    onChanged: (val) => setState(() => this._temp = val),
                    value: this._temp,
                    activeColor: C.primaryColour,
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: _width / 1.25,
                    child: TextFormField(
                      enabled: this._temp,
                      decoration: new InputDecoration(
                          hintText: "Edit the Reminder Text"),
                      controller: _reminderController,
                      //initialValue: this.alarm.getReminder,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
