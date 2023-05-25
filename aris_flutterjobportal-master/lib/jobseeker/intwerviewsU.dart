import 'package:flutter/material.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';

import '../jobseeker/home_page.dart';

void main() => runApp( interviewsU());

class interviewsU extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Interviews' ),
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
        ),
        body:  notification(),
      ),
    );
  }
}

class notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[

        Card(child:ListTile( title: Text("Comsats Lahore"),subtitle: Text("Interview on 4 Aug."), leading: CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d1.jpg")), )),
        Card(child:ListTile( title: Text("Comsats Islamabad"),subtitle: Text("Interview on 15 Aug."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d1.jpg")),)),
        Card(child:ListTile( title: Text("comsats Sahiwal"),subtitle: Text("Interview on Saturday."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d1.jpg")), )),
        Card(child:ListTile(title: Text("comsats Wah"), subtitle: Text("Interview on 2 October."), leading: CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d1.jpg")), )),
        Card(child:ListTile( title: Text("Comsats Vehari "),subtitle: Text("Interview on 11 February."), leading:  CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d1.jpg")),)),

      ],
    );
  }
}
