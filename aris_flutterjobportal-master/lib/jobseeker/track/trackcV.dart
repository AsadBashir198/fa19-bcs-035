import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';

class FirestoreCheckboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track your CV'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('cvtrack1')
            .doc('resume5')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            Map<String, dynamic> data = snapshot.data.data();
            if (data != null && data.containsKey('procedure')) {
              List<String> selectedDays = List<String>.from(data['procedure']);
              return ListView.builder(
                itemCount: selectedDays.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Row(
                      children: [
                        Icon(Icons.check_box),
                        Text('Your Cv is: ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,),),
                        SizedBox(width: 30.0),
                        Text(selectedDays[index]),
                        SizedBox(width: 8),


                      ],
                    ),
                  );
                },
              );



            }
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}



class cvtrackU extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cvtrack',
      home: FirestoreCheckboxScreen(),
    );
  }
}
