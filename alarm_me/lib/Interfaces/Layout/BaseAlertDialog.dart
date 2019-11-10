import 'package:alarm_me/Constatnts/c.dart';
import 'package:flutter/material.dart';


class BaseAlertDialog extends StatelessWidget {
  String _title;
  String _content;
  String _yes;
  String _no;
  Function _yesOnPressed;
  Function _noOnPressed;

  BaseAlertDialog(
      {String title,
      String content,
      Function yesOnPressed,
      Function noOnPressed,
      String yes = "Yes",
      String no = ""}) {
    this._title = title;
    this._content = content;
    this._yesOnPressed = yesOnPressed;
    this._noOnPressed = noOnPressed;
    this._yes = yes;
    this._no = no;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text(
        this._title,
        style: new TextStyle(
          color: C.primaryColour,
          //fontWeight: FontWeight.w100,
        ),
      ),
      content: new Text(this._content),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      actions: <Widget>[
        new FlatButton(
          child: new Text(this._yes),
          textColor: C.primaryColour,
          onPressed: () {
            this._yesOnPressed();
          },
        ),
        // new FlatButton(
        //   child: Text(this._no),
        //   textColor: C.primaryColour,
        //   onPressed: () {
        //     this._noOnPressed();
        //   },
        // ),
      ],
    );
  }
}
