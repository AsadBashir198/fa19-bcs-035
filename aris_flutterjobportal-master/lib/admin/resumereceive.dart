import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeAdmin.dart';

void main() => runApp(res());

class res extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.indigo[700],
        ),
        home: resumerec());
  }
}

class resumerec extends StatefulWidget {
  @override
  _resumerecState createState() => _resumerecState();
}

class _resumerecState extends State<resumerec> {
  @override
  Widget build(BuildContext context) {
    var card = Container(
      height: 120,
      child: Card(
        elevation: 9,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: ListTile(
          dense: false,

          title: Text(
            "For Post of Lecturer",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          subtitle: Text(
            "Applicant: Mustafa Tahir",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Resumes"),
        centerTitle: true,
        actionsIconTheme: IconThemeData(size: 32,),
       backgroundColor: Color(0xFF031047),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              card,
              card,
              card,
              card,
              card,
              card,
            ],
          ),
        ),
      ),
    );
  }
}