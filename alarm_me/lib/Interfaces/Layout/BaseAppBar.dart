import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  //final Color backgroundColor = Colors.blue;
  final Text title = new Text("Alarm Me");
  static final AppBar appBar = new AppBar();
  //final List<Widget> widgets;

  BaseAppBar({Key key}) : super(key: key);

  void _goTo(BuildContext tempContext, String route) {
    bool isNewRouteSameAsCurrent = false;

    Navigator.popUntil(tempContext, (r) {
      if (r.settings.name == route) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });

    if (!isNewRouteSameAsCurrent) {
      Navigator.pushNamed(tempContext, route);
    }

    isNewRouteSameAsCurrent = false;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      //backgroundColor: backgroundColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            _goTo(context, '/Home');
          },
          tooltip: "Home",
        ),
        IconButton(
          icon: Icon(Icons.backspace),
          onPressed: () async{
            await FirebaseAuth.instance.signOut();
            _goTo(context,'/Login');
          },
          tooltip: "Profile",
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
