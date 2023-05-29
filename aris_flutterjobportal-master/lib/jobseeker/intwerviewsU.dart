import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';

import '../jobseeker/home_page.dart';

void main() => runApp( interview_user());

class interview_user extends StatefulWidget {


  @override
  State<interview_user> createState() => _interview_userState();
}

class _interview_userState extends State<interview_user> {


  TextEditingController company = TextEditingController();

  var co;

  TextEditingController contact = TextEditingController();

  var con;

  TextEditingController testdate = TextEditingController();
  var test_date;

  TextEditingController interviewdate = TextEditingController();
  var intrerviewedate;

  TextEditingController jobtitle = TextEditingController();
  var jotitle;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Interviews'),
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
                margin: EdgeInsets.all(15.0),
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

                              Text('Company:',
                                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              SizedBox(width: 30.0),
                              Text(snapshot.data.docs[index]['company']),
                            ]
                        ),
                        SizedBox(height: 10.0),
                        Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Text('Contact:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              SizedBox(width: 49.0),
                              Text(snapshot.data.docs[index]['contact']),
                            ]

                        ),
                        SizedBox(height:  10.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Test_date:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              SizedBox(width: 49.0),
                              Text(snapshot.data.docs[index]['test_date']),
                            ]
                        ),
                        SizedBox(height:  10.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('Interview_Date:',style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                              SizedBox(width: 49.0),
                              Text(snapshot.data.docs[index]['interviewdate']),
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

                height: 180.0,
              );
            },

          );

        },
      ),

    );
  }
}


