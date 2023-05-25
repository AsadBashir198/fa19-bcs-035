import 'package:flutter/material.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';

import '../jobseeker/home_page.dart';

void main() => runApp( interviewsAdmin());

class interviewsAdmin extends StatelessWidget {

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
                  MaterialPageRoute(builder: (context) =>  homeadmin()),
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

        Card(child:ListTile( title: Text("Shadab Ali"),subtitle: Text("Interview on 4 Aug."), leading: CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")), )),
        Card(child:ListTile( title: Text("Haider Ali"),subtitle: Text("Interview on 15 Aug."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")),)),
        Card(child:ListTile( title: Text("Farhan"),subtitle: Text("Interview on Saturday."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")), )),
        Card(child:ListTile(title: Text("Sajjad"), subtitle: Text("Interview on 2 October."), leading: CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d.jpg")), )),
        Card(child:ListTile( title: Text("Naveed "),subtitle: Text("Interview on 11 February."), leading:  CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d.jpg")),)),

      ],
    );
  }
}
