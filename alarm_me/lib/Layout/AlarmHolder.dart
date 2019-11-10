import 'package:flutter/material.dart';

class AlarmHolder extends StatelessWidget {
  //final Color backgroundColor = Colors.blue;
  //final Text title;
  //static final AppBar appBar = new AppBar();
  //final List<Widget> widgets;

  //const BaseAppBar({Key key, this.title, this.widgets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        customBorder: Border.all(width: 5, color: Colors.black),
        //Should use the List Tile , And the content of this Widget should go inside that widgets child.

        child: new Row(
          children: <Widget>[
            new Text("9:10 PM"),
            new Text("Location : Moratuwa")
          ],
        ),
      ),
    );
  }
}
