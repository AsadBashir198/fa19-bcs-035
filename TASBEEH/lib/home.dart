import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'create.dart';

class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new MyApp();
  }

}

class MyApp extends State<home> {
  int _tasbeehCount = 0;

  void counter() {
    DatabaseReference test = FirebaseDatabase.instance.ref().child("test");
    test.set("Hello Firebase${_tasbeehCount}");
    setState(() {
      _tasbeehCount = _tasbeehCount + 1;
    });
  }
  void refresh(){
    setState(() {
      _tasbeehCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      drawer: Drawer(
        backgroundColor: Color(0xFEBDBDBD),

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
      body: new Container(
          child : new Column(
            children: <Widget>[
              new Center(
                child: new Text("Tasbeeh!",
                  style: new TextStyle(fontSize: 30.0,
                      color: Colors.black),),
              ),
              new Expanded(
                  child: new Center(
                    child: new Text('$_tasbeehCount',
                      style: new TextStyle(
                          color: _tasbeehCount < 50 ? Colors.greenAccent: Colors.red,
                          fontSize: 40.3,
                          fontWeight: FontWeight.w500
                      ),),
                  )),
              SizedBox(height: 100.0),

              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: counter,
                        child: new Text("press!",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
              SizedBox(height: 15.0),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: refresh,
                        child: new Text("Refresh!",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
              SizedBox(height: 150.0),

              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: refresh,
                        child: new Text("Save Tasbeeh",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
              SizedBox(height: 250.0),
            ],
          )

      ),
    );
  }
}
