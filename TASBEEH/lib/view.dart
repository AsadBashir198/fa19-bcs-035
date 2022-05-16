import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';

class View extends StatefulWidget {


  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {

  TextEditingController names = TextEditingController();

  var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              var docid=snapshot.data.docs[index].id;
              return Container(
                margin: EdgeInsets.all(10.0),

                child: Center(child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(snapshot.data.docs[index]['name']),
                    Text(snapshot.data.docs[index]['count']),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       FlatButton(
                         color: Colors.tealAccent,
                         child: Text('Delete', style: TextStyle(fontSize: 13.0,color: Colors.black),),
                         onPressed: () async{
                           var ref=FirebaseFirestore.instance.collection("Tasbeeh").doc(docid);
                           ref.delete();
                         },

                       ),
                       SizedBox(
                         width: 5.0,
                       ),

                       FlatButton(
                         color: Colors.white,
                         child: Text('Update', style: TextStyle(fontSize: 13.0,color:Colors.black),),
                         onPressed: () {

                      showDialog(
                      context: context,
                      builder: (context) {
                      return
                           AlertDialog(
                             title: Text("Update"),
                             actions: <Widget>[
                               new Column(
                                 children: [
                                   TextField(

                                     controller: names,
                                     decoration: InputDecoration(
                                         border: OutlineInputBorder(
                                             borderSide: const BorderSide(
                                                 width: 10,
                                                 color: Colors.purpleAccent
                                             )
                                         ),
                                         labelText: "Enter Name",
                                         filled: true,
                                         fillColor: Colors.black12,

                                     ),

                                   ),
                                   FlatButton(
                                       color: Colors.tealAccent,

                                       child:Text("Save"),

                                       onPressed: () {
                                         name = names.text;
                                         FirebaseFirestore.instance.collection("Tasbeeh").doc(docid).update({
                                           'name':'$name',
                                         });

                                       }

                                   )
                                 ],
                               )
                             ],
                           ); });



                         },
                       ),
                     ],
                   )
                  ],
                )),
                color: Colors.green,
                height: 90.0,
              );
            },

          );

        },
      ),

    );
  }
}

