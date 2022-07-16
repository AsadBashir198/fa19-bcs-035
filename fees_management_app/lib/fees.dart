import 'package:flutter/material.dart';

import 'fee_classwise.dart';
import 'm_homepage.dart';


class fees extends StatefulWidget {
  @override
  _feesState createState() => _feesState();
}

class _feesState extends State<fees> {
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(

        appBar: AppBar(

          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  m_homepage()),
                );
              }
          ),
          backgroundColor: Colors.blueGrey,
          title: Text('Fees Management App'),
        ),
        body: Center(child: Column(children: <Widget>[
          Container(
            margin: EdgeInsets.all(80),
            child: FlatButton(
              child: Text('Select Choice',style:TextStyle(fontSize: 30)),
              onPressed: () {},
            ),
          ),

          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>fee_classwise()));
            },

            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                color:Colors.blueGrey ),
              margin: EdgeInsets.all( 30.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(" Add Fees classwise",style: TextStyle(color:Colors.white,fontSize: 30 ),)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){

            },

            child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                color:Colors.blueGrey ),
              margin: EdgeInsets.all( 30.0),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text(" Add Fees monthwise",style: TextStyle(color:Colors.white,fontSize: 30 ),)
                ],
              ),
            ),
          ),


        ]))),
  );
}