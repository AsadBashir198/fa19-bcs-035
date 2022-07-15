import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_job_portal/UserProfile.dart';
import 'package:flutter_job_portal/employers.dart';
import 'package:flutter_job_portal/settings.dart';
import 'package:flutter_job_portal/ui/alljob.dart';
import 'package:flutter_job_portal/ui/applicants.dart';


import '../contactus.dart';

void main()
{
  runApp(Homepage());
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Finder App',
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

          title: Text("Job Finder App"),

          actionsIconTheme: IconThemeData(size: 32,),

        ),

      drawer: Drawer(
        backgroundColor:Colors.white,


        child: ListView(

          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.only(top:40.0,left: 25.0),
          children: [
            Text(
              'Job Finder App ',
              style: TextStyle(
                  height: 2,
                  fontFamily: 'SpecialElite',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                  height: 2,
                  fontFamily: 'SpecialElite',
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0),
            ),
            ListTile(
              title: const Text('Home'),
              leading:Icon(Icons.home),
              onTap: () {
                // Update the state of the app
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Homepage()),
                );
              },
            ),
            ListTile(
              title: const Text('View Jobs'),
              leading:Icon(Icons.search),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  alljobs()),
                );
              },
            ),
            ListTile(
              title: const Text('Setting'),
              leading:Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  SettingsPage()),
                );

              },
            ),
            ListTile(
              title: const Text('Contact Us'),
              leading:Icon(Icons.contact_mail_sharp),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ContactUs()),
                );

              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 150),
          child: GridView(

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

              crossAxisCount: 2,
            ),
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>alljobs()));
                },

                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_rounded,size: 50,color: Colors.green,),
                      Text(" All Jobs",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>employer()));
                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_to_photos_rounded,size: 50,color: Colors.green,),
                      Text("Post Job",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],

                  ),

                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Resume()));
                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_box_rounded,size: 50,color: Colors.green,),
                      Text("Resume",style: TextStyle(color:Colors.white,fontSize: 20 ),)
                    ],

                  ),

                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>applicants()));
                },
                child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    color:Colors.blueGrey ),
                  margin: EdgeInsets.all( 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person,size: 50,color: Colors.green,),
                      Text("Applicants",style: TextStyle(color:Colors.white,fontSize: 20 ),)
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