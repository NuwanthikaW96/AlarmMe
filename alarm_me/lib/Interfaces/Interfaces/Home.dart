import 'package:alarm_me/Interfaces/Layout/BaseAppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
            itemBuilder: (context, index) =>
              _buildListItem(snapshot.data.documents[index]),
          );
        },
      ),
      

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.alarm_add),
        onPressed: () {
          null;
        },
        tooltip: "Add an Alarm",
      ),
    );
  }
}



Widget _fireSearch(String queryText) {
  return new StreamBuilder(
    stream: Firestore.instance
    .collection('Alarms')
    .where('UID', isEqualTo: queryText)
    .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return new Text('Loading...');
      return new ListView.builder(
        itemCount: snapshot.data.documents.length,
        itemBuilder: (context, index) =>
            _buildListItem(snapshot.data.documents[index]),
      );
    },
  );
}

Widget _buildListItem(DocumentSnapshot document) {
  return new ListTile(
    title: document['title'],
    subtitle: document['subtitle'],
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

