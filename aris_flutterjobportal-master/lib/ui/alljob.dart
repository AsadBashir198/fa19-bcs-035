import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_core/firebase_core.dart';

import 'applyform.dart';



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
        backgroundColor: const Color(0xFF031047),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                             children: [
                               ElevatedButton(
                                 child: Text('Apply'),
                                 style: ElevatedButton.styleFrom(
                                   primary: Colors.green,
                                   onPrimary: Colors.white,
                                   shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
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
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15)
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

