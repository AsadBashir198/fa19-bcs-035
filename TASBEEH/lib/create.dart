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
      drawer: Drawer(
        backgroundColor: Color(0xFEDBF59C),

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.lime,

              ),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("images/tas1.jpg"),
              ),
            ),
            Text(
              'Tasbeeh App ',
              style: TextStyle(
                  height: 2,
                  fontFamily: 'SpecialElite',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                  height: 2,
                  fontFamily: 'SpecialElite',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  createTasbeeh()),
                );
              },
            ),
            ListTile(
              title: const Text('View Tasbeeh'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Setting'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Contact Us'),
              onTap: () {

                // Update the state of the app

                // Then close the drawer

              },
            ),
          ],
        ),
      ),
      appBar: new AppBar(
        title: new Text('Tasbeeh Counter'),
        backgroundColor: Colors.green,

      ),

      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children:[
         CircleAvatar(
            radius: 175.0,
            backgroundImage: AssetImage("images/tas.png"),
          ),
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
