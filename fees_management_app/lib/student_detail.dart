import 'package:flutter/material.dart';

class s_detail extends StatefulWidget {
  @override
  _s_detailState createState() => _s_detailState();
}

class _s_detailState extends State<s_detail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text('Fees Management App'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(80),
              child: FlatButton(
                child: Text('Select Person',style:TextStyle(fontSize: 30)),
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: FlatButton(
                child: Text('Admin'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),

          ]))),
    );
  }
}