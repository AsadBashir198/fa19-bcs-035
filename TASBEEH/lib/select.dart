import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home.dart';

class select extends StatefulWidget {


  @override
  _selectState createState() => _selectState();
}

class _selectState extends State<select> {
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

            FlatButton(
              child:Text("Allah u Akbar"),
              padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15
              ),
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Colors.green,
                      width: 2
                  )
              ),
              textColor: Colors.green,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  home()),
                );
              },
            ),
            SizedBox(height: 10.0,),
            FlatButton(
              child:Text("Subhan Allah"),
              padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15
              ),
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Colors.green,
                      width: 2
                  )
              ),
              textColor: Colors.green,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  home()),
                );
              },
            ),

            SizedBox(height: 10.0,),
            FlatButton(

              child:Text("AlhamduLillah"),
              padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15
              ),
              shape: StadiumBorder(
                  side: BorderSide(
                      color: Colors.green,
                      width: 2
                  )
              ),
              textColor: Colors.green,
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  home()),
                );
              },
            ),

          ],


      ),

    );
  }
}
