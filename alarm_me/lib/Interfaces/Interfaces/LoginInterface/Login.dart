import 'package:alarm_me/Constatnts/FormValidator.dart';
import 'package:alarm_me/Constatnts/c.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final _formKey = GlobalKey<FormState>();
  bool _autoActivate = false;

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
            top: _height / 20,
            left: _width / 20,
            right: _width / 20,
            bottom: _height / 15),
        child: Form(
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
                    'Login',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontFamily: "AlarmMe",
                      fontSize: _height / 17,
                      fontWeight: FontWeight.w600,
                      color: C.primaryColour,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration:
                      new InputDecoration(labelText: "Enter the email address"),
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Please enter the email';
                    }
                    return FormValidator.validateEmail(value);
                  },
                  onSaved: (value) => _email = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 18.0),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration:
                      new InputDecoration(labelText: "Enter the password"),
                  validator: (value) {
                    if(value.isEmpty){
                      return 'Please enter the password';
                    }
                    return null;
                  },
                  onSaved: (value) => _password = value,
                ),
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 2 * (_width / 3.2),
                    child: RaisedButton(
                      // onPressed: () {
                      //   null;
                      // },
                      //Put this logic in the Login Handler
                      onPressed: () => Navigator.of(context).pushNamed('/Register'),
                      child: Text('Register'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: _width / 24),
                    child: SizedBox(
                      width: _width / 4.29,
                      child: RaisedButton(
                        //color: C.primaryColour,
                        //textColor: C.secondaryColour,
                        // onPressed: () async {
                        //   if (_formKey.currentState.validate()) {
                        //     _formKey.currentState.save();
                        //     _auth = PhoneAuth(_phoneNumber);
                        //     print ("qwwqqw"+_phoneNumber);
                        //     bool _registerCheck =
                        //         await _auth.checkIfUserRegistered();
                        //     if (_registerCheck) {
                        //       bool _check =
                        //           await _auth.verifyPhoneNumber();
                        //       if (_check) {
                        //         _showVerifyDialog(context);
                        //       } else {
                        //         _showFailedDialog(context);
                        //       }
                        //     } else {
                        //       _showGoToRegister(context);
                        //     }

                        //     print(_phoneNumber);
                        //   } else {
                        //     _autoActivate = true;
                        //   }
                        // },
                        
                        onPressed:signIN ,
                        // onPressed: (){
                        //   TimePicker timePicker = new TimePicker(context, _height);
                        //   timePicker.build();
                        // },
                        child: Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIN() async{
    final _form = _formKey.currentState;
    if (_form.validate()){
      _form.save();
      try{
        AuthResult res= (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)) ;
        FirebaseUser user=res.user;
        C.user = user;
        print(user.email);
        print ("asljdilqjdijqd");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(
            user: user)));
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
    }
  }
  
}

// class LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _validationController = new TextEditingController();
//   bool _autoActivate = false;
//   MyBehavior _myBehavior = C.buildViewportChrome();
//   String _phoneNumber;
//   String _validation;
//   static PhoneAuth _auth;

//   void _showVerifyDialog(BuildContext tempContext) {
//     showDialog(
//         context: context,
//         builder: (_) => NetworkGiffyDialog(
//               image: Image(
//                 image: AssetImage(C.imageLink + "ok.jpg"),
//               ),
//               title: new Text(
//                 "Verification ID Sent",
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15,
//                     color: C.primaryColour),
//               ),
//               description: new Text(
//                 "Please Enter the sent Verification Id in the following box",
//                 style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 10,
//                     color: C.primaryColour),
//               ),
//               //description: new TextField(),
//               buttonOkColor: C.secondaryColour,
//               cornerRadius: 15,
//               onlyOkButton: true,

//               onOkButtonPressed: () async {
//                 Navigator.pop(tempContext);
//                 _auth.verifyPhoneNumber();
//                 showDialog(
//                   context: tempContext,
//                   child: new SimpleDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           TextField(
//                             controller: _validationController,
//                             decoration: new InputDecoration(
//                               labelText: "Enter the Verification code",
//                             ),
//                           ),
//                           RaisedButton(
//                             child: new Text(
//                               "OK",
//                               style: new TextStyle(
//                                   color: C.primaryColour,
//                                   backgroundColor: C.secondaryColour),
//                             ),
//                             onPressed: () async {
//                               _validation = _validationController.text;
//                               _auth.setSmsCode = _validation;
//                               try {
//                                 await _auth.signInWithPhoneNumber();

//                                 Navigator.pop(tempContext);
//                                 Navigator.of(tempContext).pushReplacement(
//                                     MaterialPageRoute(
//                                         builder: (BuildContext context) =>
//                                             Home()));
//                                 print(_validation);
//                               } catch (e) {
//                                 print (e);
//                                 _showFailedDialog(tempContext);
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ));
//   }

//   void _showFailedDialog(BuildContext tempContext) {
//     showDialog(
//       context: tempContext,
//       builder: (_) => NetworkGiffyDialog(
//         image: new Image(
//           image: new AssetImage(C.imageLink + "false.jpg"),
//         ),
//         title: new Text(
//           "Verification Failed",
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//               color: C.primaryColour),
//         ),
//         description: new Text(
//           "Please check your internt connection and try again!",
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 10,
//               color: C.primaryColour),
//         ),
//         onlyOkButton: true,
//         buttonOkColor: C.secondaryColour,
//         onOkButtonPressed: () {
//           Navigator.pop(tempContext);
//         },
//       ),
//     );
//   }

//   void _showGoToRegister(BuildContext tempContext) {
//     showDialog(
//       context: tempContext,
//       builder: (_) => NetworkGiffyDialog(
//         image: new Image(
//           image: AssetImage(C.imageLink + "register.jpg"),
//         ),
//         title: new Text(
//           "Please Register",
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//               color: C.primaryColour),
//         ),
//         description: new Text(
//           "You have not registered , Please Register to continue!",
//           style: TextStyle(
//               fontWeight: FontWeight.w500,
//               fontSize: 10,
//               color: C.primaryColour),
//         ),
//         buttonOkColor: C.secondaryColour,
//         onlyOkButton: true,
//         onOkButtonPressed: () {
//           Navigator.pop(tempContext);
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     double _height = MediaQuery.of(context).size.height;
//     double _width = MediaQuery.of(context).size.width;
//     // Build a Form widget using the _formKey created above.
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
//                   top: _height / 8,
//                   left: _width / 20,
//                   right: _width / 20,
//                   bottom: _height / 15),
//               child: Padding(
//                 padding: EdgeInsets.only(top: _height / 6),
//                 child: Form(
//                   key: _formKey,
//                   autovalidate: _autoActivate,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 18.0),
//                         child: Center(
//                           child: new Text(
//                             'Login',
//                             textAlign: TextAlign.center,
//                             style: new TextStyle(
//                               fontFamily: "Monoton",
//                               fontSize: _height / 17,
//                               fontWeight: FontWeight.w600,
//                               color: C.secondaryColour,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 18.0),
//                         child: TextFormField(
//                           keyboardType: TextInputType.number,
//                           decoration: new InputDecoration(
//                             labelText: "Enter Phone number",
//                           ),
//                           validator: (value) {
//                             return FormValidator.validatePhoneNumber(value);
//                           },
//                           onSaved: (String value) {
//                             _phoneNumber = value;
//                             _phoneNumber = _phoneNumber.substring(1, 10);
//                             _phoneNumber = "+94" + _phoneNumber;
//                           },
//                         ),
//                       ),
//                       Row(
//                         children: <Widget>[
//                           SizedBox(
//                             width: 2 * (_width / 3.2),
//                             child: RaisedButton(
//                               onPressed: () => Navigator.of(context)
//                                   .pushReplacement(MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                           Register())),
//                               child: Text('Register'),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(left: _width / 24),
//                             child: SizedBox(
//                               width: _width / 4.29,
//                               child: RaisedButton(
//                                 color: C.primaryColour,
//                                 textColor: C.secondaryColour,
//                                 onPressed: () async {
//                                   if (_formKey.currentState.validate()) {
//                                     _formKey.currentState.save();
//                                     _auth = PhoneAuth(_phoneNumber);
//                                     print ("qwwqqw"+_phoneNumber);
//                                     bool _registerCheck =
//                                         await _auth.checkIfUserRegistered();
//                                     if (_registerCheck) {
//                                       bool _check =
//                                           await _auth.verifyPhoneNumber();
//                                       if (_check) {
//                                         _showVerifyDialog(context);
//                                       } else {
//                                         _showFailedDialog(context);
//                                       }
//                                     } else {
//                                       _showGoToRegister(context);
//                                     }

//                                     print(_phoneNumber);
//                                   } else {
//                                     _autoActivate = true;
//                                   }
//                                 },
//                                 child: Text('Login'),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),

//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.display1,
//             ),
//             RaisedButton(
//               child: new Text("HIII"),
//               onPressed: () {
//                 null;
//               },
//             ),
//             TextFormField(
//               decoration: new InputDecoration(
//                 labelText: "Enter the name"
//               ),
//             ),
//             TextFormField(
//               decoration: new InputDecoration(
//                 labelText: "Enter the name"
//               ),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Add an Alarm',
//         child: Icon(Icons.alarm_add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

