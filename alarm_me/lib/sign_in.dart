import 'package:alarm_me/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';





class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState()  => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                onPressed:signIN ,
                child: Text('Sign In'),
              ),
        ],
        ),
        ),
      );
      
  } 

  Future<void> signIN() async{
    print("HI");
    final _form = _formkey.currentState;
    if (_form.validate()){
      _form.save();
      try{
        print("Hello");
         AuthResult res= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) ;
         FirebaseUser user=res.user;
         Navigator.push(context, MaterialPageRoute(builder: (context) => Home(
             user: user)));
        print("Bye");

      }
     catch(e){
       print(e.message);
     }
      //todo login to firebase
    }
    
  }

}




