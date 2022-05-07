import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class subhanAllah extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return new makeItRainState();
  }

}

class makeItRainState extends State<subhanAllah> {
  int _tasbeehCount = 1;

  void counter() {
    DatabaseReference test = FirebaseDatabase.instance.ref().child("test");
    test.set("Hello Firebase${_tasbeehCount}");
    setState(() {
      _tasbeehCount = _tasbeehCount + 1;
    });
  }
  void refresh(){
    setState(() {
      _tasbeehCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Subhan Allah'),
        backgroundColor: Colors.green,
      ),
      body: new Container(
          child : new Column(
            children: <Widget>[
              new Center(
                child: new Text("Tasbeeh!",
                  style: new TextStyle(fontSize: 30.0,
                      color: Colors.greenAccent),),
              ),
              new Expanded(
                  child: new Center(
                    child: new Text('$_tasbeehCount',
                      style: new TextStyle(
                          color: _tasbeehCount < 50 ? Colors.greenAccent: Colors.red,
                          fontSize: 40.3,
                          fontWeight: FontWeight.w500
                      ),),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: counter,
                        child: new Text("press!",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  )),
              new Expanded(
                  child: new Center(
                    child: new FlatButton(color: Colors.lightGreen,
                        textColor: Theme.of(context).buttonColor,
                        onPressed: refresh,
                        child: new Text("Refresh!",
                          style: new TextStyle(
                              fontSize: 18.3,
                              color: Colors.black
                          ),)),
                  ))
            ],
          )

      ),
    );
  }
}
