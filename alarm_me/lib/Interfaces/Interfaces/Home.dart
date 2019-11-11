import 'package:alarm_me/Classes/Alarm.dart';
import 'package:alarm_me/Classes/AlarmLibrary.dart';
import 'package:alarm_me/Interfaces/Interfaces/AlarmInterfaceEdit/AlarmInterfaceEdit.dart';
import 'package:alarm_me/Interfaces/Layout/BaseAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Constatnts/c.dart';
import 'AlarmInterfaceNew/AlarmInterfaceNew.dart';

class Home extends StatefulWidget {
  final FirebaseUser user;

  Home({this.user});

  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print(C.user.email + "dsandjadajdaksjhkdjaks");
    return Scaffold(
      appBar: BaseAppBar(),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Alarms')
            .where('UID', isEqualTo: widget.user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return new Text('Loading...');
          return new ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                print("addasdaadasdasd");
                return _buildListItem(snapshot.data.documents[index],context);

                // print (snapshot.data.document.length);
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.alarm_add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AlarmInterfaceNew()));
        },
        tooltip: "Add an Alarm",
      ),
    );
  }
}

// Widget _fireSearch(String queryText) {
//   return new StreamBuilder(
//     stream: Firestore.instance
//         .collection('Alarms')
//         .where('UID', isEqualTo: queryText)
//         .snapshots(),
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) return new Text('Loading...');
//       return new ListView.builder(
//           itemCount: snapshot.data.documents.length,
//           itemBuilder: (context, index) {
//             print(snapshot.data.document[index].toString());
//             //print (snapshot.data.documents.length);
//             print("dsajklajdklasdksa");
//             return _buildListItem(snapshot.data.documents[index]);
//           });
//     },
//   );
// }

Widget _buildListItem(DocumentSnapshot document, BuildContext context) {
  String _dId = document.documentID;
  GeoPoint _geoPoint = document['location'];
  String _name = document['Name'];
  bool _enabled = document['enabled'];
  String _uid = document['UID'];
  String _reminder = document['reminder'];

  Alarm _alarm = new Alarm(
      dId: _dId,
      enabled: _enabled,
      geoPoint: _geoPoint,
      name: _name,
      reminder: _reminder,
      uid: _uid);
  AlarmLibrary.addAlarm(_alarm);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: C.primaryColour),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: new ListTile(
        title: Center(child: new Text(document['Name'])),
        subtitle: Column(
          children: <Widget>[
            new Text("Latitude :" + _geoPoint.latitude.toString()),
            new Text("Longitude :" + _geoPoint.longitude.toString()),
          ],
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlarmInterfaceEdit(alarm: _alarm))),
      ),
    ),
  );
}

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() {
//     return _MyHomePageState();
//   }
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Baby Name Votes')),
//       body: _buildBody(context),
//     );
//   }

//   Widget _buildBody(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: Firestore.instance.collection('baby').snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) return LinearProgressIndicator();

//         return _buildList(context, snapshot.data.documents);
//       },
//     );
//   }

//   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//     return ListView(
//       padding: const EdgeInsets.only(top: 20.0),
//       children: snapshot.map((data) => _buildListItem(context, data)).toList(),
//     );
//   }

//   Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
//     final record = Record.fromSnapshot(data);

//     return Padding(
//       key: ValueKey(record.name),
//       padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey),
//           borderRadius: BorderRadius.circular(5.0),
//         ),
//         child: ListTile(
//           title: Text(record.name),
//           trailing: Text(record.votes.toString()),
//           onTap: () =>
//               record.reference.updateData({'votes': FieldValue.increment(1)}),
//         ),
//       ),
//     );
//   }
// }

// class Record {
//   final String name;
//   final int votes;
//   final DocumentReference reference;

//   Record.fromMap(Map<String, dynamic> map, {this.reference})
//       : assert(map['name'] != null),
//         assert(map['votes'] != null),
//         name = map['name'],
//         votes = map['votes'];

//   Record.fromSnapshot(DocumentSnapshot snapshot)
//       : this.fromMap(snapshot.data, reference: snapshot.reference);

//   @override
//   String toString() => "Record<$name:$votes>";
// }
