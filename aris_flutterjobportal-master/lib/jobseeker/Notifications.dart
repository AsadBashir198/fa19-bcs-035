import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';

import '../jobseeker/home_page.dart';



class alertsUser extends StatefulWidget {


  @override
  State<alertsUser> createState() => _alertsUserState();
}

class _alertsUserState extends State<alertsUser> {


  TextEditingController names = TextEditingController();

  TextEditingController company = TextEditingController();




  var com;
  var name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Notifications'),
        centerTitle: true,
        backgroundColor: const Color(0xFF031047),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  homeadmin(),),
              );
            }
        ),

      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('message').snapshots(),
        builder: (context,AsyncSnapshot snapshot){
          if(!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context,int index){
              var docid=snapshot.data.docs[index].id;
              return Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                child: Center(
                  child: Column(
                    children: [

                      Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('Admin posted:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 30.0),
                            Container(child: Text(snapshot.data.docs[index]['body'],style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.right,),),

                          ]

                      ),
                      SizedBox(height: 10.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Text('Job_title:',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 62.0),

                            Container(child:  Text(snapshot.data.docs[index]['title'],style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.right,), ),
                          ]
                      ),

                      // Row(
                      //
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //
                      //       Text('Last Date:',
                      //         style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                      //       SizedBox(width: 49.0),
                      //      Text(snapshot.data.docs[index]['lastdate']),
                      //     ]
                      //
                      // ),




                    ],
                  ),


                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15), //border corner radius
                  boxShadow:[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),

                height: 100.0,
              );
            },

          );

        },
      ),

    );
  }
}

