import 'package:flutter/material.dart';
import 'package:alarm_me/widgets/info_card.dart';

const profile_image = 'images/logo.jpg';
const name = 'Thuvarahan';
const email = 'thuva@gmail.com';
const phone = '0771234567';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('AlarmMe'),
        leading: IconButton(icon:Icon(Icons.arrow_back),
          onPressed:() => Navigator.pop(context, false),
        )
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
              ),
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(profile_image),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
              ),
              SizedBox(
                height: 20,
                child: Divider(
                  color: Colors.teal.shade700,
                ),
              ),
              InfoCard(
                text: email,
                icon: Icons.email,
              ),
              InfoCard(
                text: phone,
                icon: Icons.phone,
              )
            ],
          ),
        ),
      ),
    );
  }
}