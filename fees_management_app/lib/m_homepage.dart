import 'package:fees_management_app/classes.dart';
import 'package:fees_management_app/main.dart';
import 'package:fees_management_app/student_detail.dart';
import 'package:fees_management_app/subject.dart';
import 'package:fees_management_app/teachers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';



void main()
{
  runApp(m_homepage());
}

class m_homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fees Management App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();

  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  MyApp()),
                );
              }
          ),
          title: Text("Fees Management App"),
          backgroundColor: Colors.blueGrey,
          actionsIconTheme: IconThemeData(size: 32,),

        ),


      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: GridView(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
            ),
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>teacher()));
                },

                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,size: 50,color: Colors.green,),
                      Text("Add Teacher",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>classes()));
                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.meeting_room_sharp,size: 50,color: Colors.green,),
                      Text("Add Classes",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>subject()));
                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book_outlined,size: 50,color: Colors.green,),
                      Text("Add Subjects",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.payment,size: 50,color: Colors.green,),
                      Text("Fees",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>student()));
                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,size: 50,color: Colors.green,),
                      Text("Add Students",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.contact_phone,size: 50,color: Colors.green,),
                      Text("Teachers Contacts",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.contact_phone_rounded,size: 50,color: Colors.green,),
                      Text("Students Contacts",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}