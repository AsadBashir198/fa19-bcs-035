import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tasbeeh/home.dart';
import 'package:tasbeeh/select.dart';

class createTasbeeh extends StatefulWidget {


  @override
  _createTasbeehState createState() => _createTasbeehState();
}

class _createTasbeehState extends State<createTasbeeh> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tasbeeh Counter'),
        backgroundColor: Colors.green,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children:[
          Container(
              width:double.infinity ,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child:FlatButton(
                child:Text("Create Tasbeeh"),
                textColor: Colors.white,
                color:Colors.green,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => select()),
                  );
                },
              )
          ),
          Container(
              width:double.infinity ,
              padding: EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child:FlatButton(
                child:Text("Tasbeeh Counter"),
                textColor: Colors.white,
                color:Colors.green,
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => home()),
                  );
                },
              )


          ),


        ],


      ),

    );
  }
}
