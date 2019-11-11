import 'package:flutter/material.dart';
import 'package:alarm_me/widgets/info_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:alarm_me/Interfaces/LoginInterface/Login.dart';

const profile_image = 'images/logo.jpg';
const name = 'Thuvarahan';
const email = 'thuva@gmail.com';
const phone = '0771234567';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  // void setState(fn) {
  //   super.setState(fn);
  // }
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
              FutureBuilder(
                future: FirebaseAuth.instance.currentUser(),
                builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.hasData) {
                    return InfoCard(
                      text: snapshot.data.email,
                      icon: Icons.email,
                    );
                  }
                  else {
                    return Text('Loading...');
                  }
                },
              ),
              FlatButton(
                child: Text(
                  "Sign Out",
                ),
                onPressed: _signOut,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future <void> _signOut()  async{
    await FirebaseAuth.instance.signOut();

    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

}



  
