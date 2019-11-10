import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;

  InfoCard({@required this.text, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: ListTile(
          leading: Icon(
            icon,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}