
import 'package:alarm_me/sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  get formState => null;
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: AppBar(


      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator:(input){
                if(input.isEmpty){
                  return 'Please type an email';
                }
              },
              onSaved: (input) => _email =input,
              decoration: InputDecoration(
                  labelText:'Email'
              ),
            ),
            TextFormField(
              validator:(input) {
                if(input.length < 6){
                  return 'Your password needs to be atleast 6 characters';
                }
              },
              onSaved: (input) => _password =input,
              decoration: InputDecoration(
                  labelText:'Password'
              ),
              obscureText: true ,
            ),
            RaisedButton(
              onPressed:signUp ,
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );

  }

  void signUp() async{
    final _form = _formkey.currentState;
    if (formState.validate()){
      formState.save();
      try{
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)) as FirebaseUser;
        user.sendEmailVerification();
        //display for the user that we sent an email
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage(
            )));
      }
      catch(e){
        print(e.message);
      }
      //todo login to firebase
    }

  }

}
