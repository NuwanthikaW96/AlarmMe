

import 'package:alarm_me/Constatnts/c.dart';
import 'package:alarm_me/Interfaces/Layout/BaseAppBar.dart';
import 'package:flutter/material.dart';

import 'AlarmInterfaceHandler.dart';

class AlarmInterface extends StatefulWidget {
  @override
  _AlarmInterfaceState createState() => _AlarmInterfaceState();
}

class _AlarmInterfaceState extends State<AlarmInterface> {
  //** Like this call the interface handlers in each respective pages

  AlarmInterfaceHandler _alarmInterfaceHandler = new AlarmInterfaceHandler();

  bool _temp = true;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: new BaseAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _height / 2.19,
              width: _width,
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
                  enabled: _temp,
                  decoration: new InputDecoration(
                    hintText: "Enter the Alarm Name",
                  ),
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
                      onPressed: () => _alarmInterfaceHandler.setLocation(context),
                      child: Text(
                        'Set Location',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _width / 24),
                    child: SizedBox(
                      width: _width / 2.5,
                      child: RaisedButton(
                        onPressed: () {
                          null;
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
                  new Text("Enable the alarm "),
                  Switch(
                    onChanged: (val) => setState(() => _temp = val),
                    value: _temp,
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
                      enabled: _temp,
                      decoration: new InputDecoration(
                          hintText: "Enter the Reminder Text"),
                    ),
                  ),
                  Switch(
                    onChanged: (val) => setState(() => _temp = val),
                    value: _temp,
                    activeColor: C.primaryColour,
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
