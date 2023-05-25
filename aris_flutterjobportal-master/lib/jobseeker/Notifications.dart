import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp( notif());

class notif extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: new AppBar(
          title: new Text('Notifications '),
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

        Card(child:ListTile( title: Text("Ahmad"),subtitle: Text("sent you a schedule."), leading: CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Farhan"),subtitle: Text("sent you a message."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Umer"),subtitle: Text("sent you a schedule."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile(title: Text("farhad"), subtitle: Text("Send you a message."), leading: CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("fakhar"),subtitle: Text("sent you Email."), leading:  CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Husnain"),subtitle: Text("sent you a message."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Junaid"),subtitle: Text("interview."), leading:  CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Ali"),subtitle: Text("sent you a schedule."), leading:  CircleAvatar(backgroundImage: AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
        Card(child:ListTile( title: Text("Asad"),subtitle: Text("sent you a message."), leading:  CircleAvatar(backgroundImage:AssetImage("assets/screenshots/3d.jpg")), trailing: Icon(Icons.star))),
      ],
    );
  }
}
