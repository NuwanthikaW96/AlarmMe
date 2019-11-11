import 'package:alarm_me/Constatnts/FormValidator.dart';
import 'package:alarm_me/Constatnts/c.dart';
import 'package:alarm_me/Interfaces/Interfaces/LoginInterface/Login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String _email, _password, _cpassword;
  final _formKey = GlobalKey<FormState>();
  bool _autoActivate = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            //top: _height / 20,
            left: _width / 20,
            right: _width / 20,
            bottom: _height / 15),
        child: Form(
          onWillPop: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Login())),
          key: _formKey,
          autovalidate: _autoActivate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: Center(
                  child: new Text(
                    'Registeration',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "AlarmMe",
                      fontSize: _height / 20,
                      fontWeight: FontWeight.w600,
                      color: C.primaryColour,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Enter Your Email Address",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Please enter an email';
                    }
                    return FormValidator.validateEmail(value);
                  },
                  onSaved: (value) => _email = value,
                  // onSaved: (value) {
                  //   //print(value);
                  //   this._phoneNumber = value;
                  // },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: "Enter Your Password",
                  ),
                  validator: (value) {
                    if(value.length < 6){
                      return 'Your password needs to be atleast 6 characters';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                  // onSaved: (String value) => _userName = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  obscureText: true,
                  decoration: new InputDecoration(
                    labelText: "Re-Enter Your Password",
                  ),
                  
                  onSaved: (value) => _cpassword = value,
                  // onSaved: (String value) => _userName = value,
                ),
              ),
              Center(
                //padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: _width - _width / 20,
                  child: RaisedButton(
                    // onPressed: () {
                    //   if (_formKey.currentState.validate()) {
                    //     _formKey.currentState.save();
                    //     _registerUser();
                    //     print(_userName);
                    //   } else {
                    //     _autoActivate = true;
                    //   }
                    // },
                    
                    onPressed: signUp,

                    child: Text('Register'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () =>Navigator.of(context).pushNamed('/Login'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void signUp() async{
    final _form = _formKey.currentState;
    if (_form.validate()){
      _form.save();
      try{

        if(_password == _cpassword){
        //display for the user that we sent an email
        Navigator.of(context).pop();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(
            )));
        }
        else {
          Fluttertoast.showToast(
              msg: "Passwords do not match!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIos: 3,
              backgroundColor: Colors.red[2000],
              textColor: Colors.white,
              fontSize: 16.0
          );
        }
      }
      catch(e){
        print(e.message);
        Fluttertoast.showToast(
            msg: e.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 3,
            backgroundColor: Colors.red[2000],
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
      //todo login to firebase
    }

  }

}

// class RegisterState extends State<Register> {
//   final _formKey = GlobalKey<FormState>();
//   bool _autoActivate = false;
//   MyBehavior _myBehavior = C.buildViewportChrome();
//   String _phoneNumber;
//   String _userName;
//   String _email;

//   void _registerUser() async {
//     try {
//       Database _database = await Database.createInstance();
//       _database.insertUser(_email, _phoneNumber, _userName);
//       _registrationComplete();
//     } catch (e) {
//       _registrationIncomplete();
//     }
//   }

//   void _registrationComplete() {
//     showDialog(
//       context: context,
//       builder: (_) => NetworkGiffyDialog(
//         image: new Image(
//           image: AssetImage(C.imageLink + "ok.jpg"),
//         ),
//         title: new Text(
//           "Registration Complete",
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//               color: C.primaryColour),
//         ),
//         description: new Text(
//           "Registration successfully completed.\nPlease Register to continue",
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 10,
//               color: C.primaryColour),
//         ),
//         buttonOkColor: C.secondaryColour,
//         onlyOkButton: true,
//         onOkButtonPressed: () {
//           Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (BuildContext context) => Login()));
//         },
//       ),
//     );
//   }

//   void _registrationIncomplete() {
//     showDialog(
//       context: context,
//       builder: (_) => NetworkGiffyDialog(
//         image: new Image(
//           image: AssetImage(C.imageLink + "false.jpg"),
//         ),
//         title: new Text(
//           "Registration Incomplete",
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//               color: C.primaryColour),
//         ),
//         description: new Text(
//           "Registration incomplete\nPlease Try again!",
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 10,
//               color: C.primaryColour),
//         ),
//         buttonOkColor: C.secondaryColour,
//         onlyOkButton: true,
//         onOkButtonPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       body: SingleChildScrollView(
//         //padding: EdgeInsets.all(34),
//         child: ScrollConfiguration(
//           behavior: _myBehavior,
//           child: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(C.imageLink + "registerBackground.jpg"),
//                 fit: BoxFit.fill,
//                 repeat: ImageRepeat.noRepeat,
//               ),
//             ),
//             child: Padding(
//               padding: EdgeInsets.only(
//                   top: _height / 20
//                   ,
//                   left: _width / 20,
//                   right: _width / 20,
//                   bottom: _height / 15),
//               child: Form(
//                 onWillPop: () => Navigator.of(context).pushReplacement(
//                     MaterialPageRoute(
//                         builder: (BuildContext context) => Login())),
//                 key: _formKey,
//                 autovalidate: _autoActivate,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 18.0),
//                       child: Center(
//                         child: new Text(
//                           'Registeration',
//                           textAlign: TextAlign.center,
//                           style: new TextStyle(
//                             fontFamily: "AlarmMe",
//                             fontSize: _height / 20,
//                             fontWeight: FontWeight.w600,
//                             color: C.secondaryColour,
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 18.0),
//                       child: TextFormField(
//                         decoration: new InputDecoration(
//                           labelText: "Enter Your Phone Number",
//                         ),
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           return FormValidator.validatePhoneNumber(value);
//                         },
//                         onSaved: (value) {
//                           //print(value);
//                           this._phoneNumber = value;
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 18.0),
//                       child: TextFormField(
//                         decoration: new InputDecoration(
//                           labelText: "Enter Your User name",
//                         ),
//                         validator: (value) {
//                           return FormValidator.validateUserName(value);
//                         },
//                         onSaved: (String value) => _userName = value,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 18.0),
//                       child: TextFormField(
//                           decoration: new InputDecoration(
//                             labelText: "Enter Your Email address",
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           validator: (value) {
//                             return FormValidator.validateEmail(value);
//                           },
//                           onSaved: (String value) => _email = value),
//                     ),
//                     Center(
//                       //padding: const EdgeInsets.symmetric(vertical: 16.0),
//                       child: SizedBox(
//                         width: _width - _width / 20,
//                         child: RaisedButton(
//                           onPressed: () {
//                             if (_formKey.currentState.validate()) {
//                               _formKey.currentState.save();
//                               _registerUser();
//                               print(_userName);
//                             } else {
//                               _autoActivate = true;
//                             }
//                           },
//                           child: Text('Submit'),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//           ),
//         ),
//       ),
//     );
//   }
// }
