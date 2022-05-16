import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';

class counter extends StatefulWidget {


  @override
  _counterState createState() => _counterState();
}

class _counterState extends State<counter> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tasbeeh Counter'),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Tasbeeh').snapshots(),
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context,int index){
              return Container(
                margin: EdgeInsets.all(6),
                child: RaisedButton(
                         child:Row(
                           mainAxisAlignment:MainAxisAlignment.spaceBetween,
                           children: [
                             Text(snapshot.data.docs[index]['name']),
                             Text(snapshot.data.docs[index]['count']),
                           ],
                         ),
                         padding: EdgeInsets.symmetric(
                           horizontal: 30,
                           vertical: 25
                          ),
                          shape: Border(
                              bottom: BorderSide(
                                  color: Colors.green,
                                  width: 2
                              )
                          ),
                          textColor: Colors.black,
                           onPressed: (){
                             Navigator.push(
                               context,
                               MaterialPageRoute(builder: (context) =>  home()),
                            );
                         },
                       ),
              );
            },

          );

        },
      ),


    );
  }
}
