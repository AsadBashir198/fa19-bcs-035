import 'package:fees_management_app/login.dart';
import 'package:fees_management_app/student_detail.dart';
import 'package:flutter/material.dart';

import 'm_login.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          appBar: AppBar(

            leading: Icon(Icons.arrow_back),
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

            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>m_login()));
              },

              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                  color:Colors.blueGrey ),
                margin: EdgeInsets.all( 30.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(" Admin",style: TextStyle(color:Colors.white,fontSize: 30 ),)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>s_login()));
              },

              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                  color:Colors.blueGrey ),
                margin: EdgeInsets.all( 30.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(" Student",style: TextStyle(color:Colors.white,fontSize: 30 ),)
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>s_login()));
              },

              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                  color:Colors.blueGrey ),
                margin: EdgeInsets.all( 30.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Teacher",style: TextStyle(color:Colors.white,fontSize: 30 ),)
                  ],
                ),
              ),
            ),

          ]))),
    );
}