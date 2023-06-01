import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';

import '../jobseeker/home_page.dart';

void main() => runApp( interviewsA());

class interviewsA extends StatefulWidget {


  @override
  State<interviewsA> createState() => _interviewsAState();
}

class _interviewsAState extends State<interviewsA> {



  TextEditingController testD = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController post = TextEditingController();
  TextEditingController interviewD = TextEditingController();



  var com;
  var tesD;
  var j_post;
  var intervD;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Applicants'),
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

                            Text('Company:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 49.0),
                            Text(snapshot.data.docs[index]['company']),
                          ]

                      ),
                      SizedBox(height: 10.0),
                      Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('Job_name:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 49.0),
                            Text(snapshot.data.docs[index]['jobtitle']),
                          ]

                      ),
                      SizedBox(height: 10.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('Interview_Date:',
                              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 30.0),
                            Text(snapshot.data.docs[index]['interviewdate']),
                          ]

                      ),
                      SizedBox(height: 10.0),


                      Row(

                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [

                            Text('Test_Date:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                            SizedBox(width: 49.0),
                            Text(snapshot.data.docs[index]['test_date']),
                          ]

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

                height: 150.0,
              );
            },

          );

        },
      ),

    );
  }
}
