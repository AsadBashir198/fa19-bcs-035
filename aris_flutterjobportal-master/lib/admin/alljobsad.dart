import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';

import 'searJobs.dart';


class alljobsad extends StatefulWidget {


  @override
  State<alljobsad> createState() => _alljobsadState();
}

class _alljobsadState extends State<alljobsad> {


  TextEditingController company = TextEditingController();

  var co;
  TextEditingController vacancies = TextEditingController();

  var vac;
  TextEditingController contact = TextEditingController();

  var con;
  TextEditingController qualification = TextEditingController();

  var qual;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('All Jobs'),
        centerTitle: true,
        backgroundColor: const Color(0xFF031047),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) =>homeadmin()),
              );
            }
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>searAd()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('jobpost').snapshots(),
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

                            Text('company:',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 30.0),
                            Text(snapshot.data.docs[index]['company']),
                          ]
                      ),
                      SizedBox(height: 20.0),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('vacancies:',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 30.0),
                            Text(snapshot.data.docs[index]['vacancies']),

                          ]

                      ),
                      SizedBox(height: 20.0),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('contact:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 49.0),
                            Text(snapshot.data.docs[index]['contact']),
                          ]

                      ),
                      SizedBox(height: 20.0),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('Qualification:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 25.0),
                            Text(snapshot.data.docs[index]['qualification']),
                          ]

                      ),




                    ],
                  )
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

                height: 240.0,
              );
            },

          );

        },
      ),

    );
  }
}



