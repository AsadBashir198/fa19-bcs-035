import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';

class select extends StatefulWidget {
  @override
  _selectState createState() => _selectState();
}

class _selectState extends State<select> {
  TextEditingController names = TextEditingController();
  TextEditingController counte = TextEditingController();
  var name;
  var count;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Tasbeeh Counter'),
          backgroundColor: Colors.green,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 115.0,
                  backgroundImage: AssetImage("images/tas.png"),
                ),
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
                      fillColor: Colors.black12
                  ),

                ),
                TextField(
                  controller: counte,

                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 10,
                              color: Colors.purpleAccent
                          )
                      ),
                      labelText: "Enter Count",
                      filled: true,
                      fillColor: Colors.black12
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        child:Text("Save"),
                        textColor: Colors.white,
                        color:Colors.green,
                        onPressed: () {
                          name=names.text;
                          count=counte.text;
                          FirebaseFirestore.instance.collection('Tasbeeh').add({'name':'$name','count':'$count'});
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Saved"),
                                  actions: <Widget>[
                                    new FlatButton(
                                      child: new Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                );
                              });
                        }
                    ),
                  ],
                ),



              ]
          ),
        )
    );
  }
}