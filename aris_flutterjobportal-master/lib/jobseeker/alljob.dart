import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_job_portal/jobseeker/searchU.dart';

import 'applyform.dart';
import 'home_page.dart';



class alljobs extends StatefulWidget {


  @override
  State<alljobs> createState() => _alljobsState();
}

class _alljobsState extends State<alljobs> {


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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Homepage()),
              );
            }
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SearchU()),
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
                              Text('Job_Title:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              SizedBox(width: 49.0),
                              Text(snapshot.data.docs[index]['jobtitle']),
                            ]
                        ),
                        SizedBox(height:  10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'company:',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 50.0),
                            Container(
                              child: Text(
                                snapshot.data.docs[index]['company'],
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:  10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'vacancies:',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 43.0),
                            Container(
                              child: Text(
                                snapshot.data.docs[index]['vacancies'],
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:  10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'contact:',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 62.0),
                            Container(
                              child: Text(
                                snapshot.data.docs[index]['contact'],
                                style: TextStyle(fontSize: 16),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height:  10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Qualification:',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 25.0),
                            Container(
                              child: Text(
                                snapshot.data.docs[index]['qualification'],
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               ElevatedButton(
                                 child: Text('Apply'),
                                 style: ElevatedButton.styleFrom(
                                   primary:  Color(0xFF4BA5A5),
                                   onPrimary: Colors.white,
                                   shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
                                 ),
                                 onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>apply()));
                                 },
                               )


                             ],
                        ),



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
                height: 230.0,
              );
            },

          );

        },
      ),

    );
  }
}



