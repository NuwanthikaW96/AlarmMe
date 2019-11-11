import 'package:alarm_me/Constatnts/c.dart';
import 'package:alarm_me/Interfaces/Layout/BaseAppBar.dart';
import 'package:flutter/material.dart';

import '../../../Classes/Alarm.dart';
import 'AlarmInterfaceHandlerEdit.dart';

class AlarmInterfaceEdit extends StatefulWidget {
  final Alarm alarm;
  AlarmInterfaceEdit({this.alarm});
  @override
  _AlarmInterfaceStateEdit createState() => _AlarmInterfaceStateEdit(alarm: this.alarm);
}

class _AlarmInterfaceStateEdit extends State<AlarmInterfaceEdit> {
  //** Like this call the interface handlers in each respective pages

  Alarm alarm;
  AlarmInterfaceHandler _alarmInterfaceHandler;
  TextEditingController _nameController;
  TextEditingController _reminderController;
  bool _temp;
  _AlarmInterfaceStateEdit({this.alarm}){
    //this.alarm = alarm;
    this._alarmInterfaceHandler = new AlarmInterfaceHandler(alarm:this.alarm);
    this._nameController = new TextEditingController();
    _nameController.text = alarm.getName;
    this._reminderController = new TextEditingController();
    _reminderController.text = alarm.getReminder;
    this._temp = alarm.getEnabled;
    print(alarm.getDid + "we;owqe;owqk;eewqeqwpeoqpw[eo[pw");
    
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
                      onPressed: () => null,//_alarmInterfaceHandler.setLocation(context),
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
                        onPressed: () async{
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
