import 'dart:math';

import 'package:flutter/material.dart';

import '../home_page.dart';
import 'constants.dart';
import 'events.dart';



TextStyle style =  TextStyle(color: Colors.white);

class trackcvuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV ',
      theme: ThemeData(
        primaryColor: const Color(0xFF031047),
      ),
      home: TimelineComponent(title: 'Timeline'),
    );
  }
}

class TimelineComponent extends StatelessWidget {
  TimelineComponent({Key key, this.title}) : super(key: key);

  final String title;

  final List<Events> listOfEvents = [
    Events(time: "Monday", eventName: "Pending", description: "Approve"),
    Events(time: "Tuesday", eventName: "Pending", description: "Transfer"),
    Events(time: "Wednesday", eventName: "Pending", description: "Go to Rector"),
    Events(time: "Friday", eventName: "Final round", description: "Accept"),
  ];

  final List<Color> listOfColors = [Constants.kPurpleColor,Constants.kGreenColor,Constants.kRedColor];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Random random = new Random();
    return Scaffold(
      drawer: Drawer(),
      appBar: new AppBar(
        title: new Text('Track your CV' ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Image.asset("assets/screenshots/banner.jpg",
                    fit: BoxFit.fitWidth),
              ),
              Positioned(
                top: 40,
                left: 30,
                child: Row(children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(

                    ),
                  ),
                ]),
              ),
             
            ],
          ),
          Flexible(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: listOfEvents.length,
                itemBuilder: (context, i) {
                  return Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(40),
                        child: Row(
                          children: [
                            SizedBox(width: size.width * 0.1),
                            SizedBox(
                              child: Text(listOfEvents[i].time),
                              width: size.width * 0.2,
                            ),
                            SizedBox(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(listOfEvents[i].eventName),
                                  Text(
                                    listOfEvents[i].description,
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 50,
                        child: new Container(
                          height: size.height * 0.7,
                          width: 1.0,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: new BoxDecoration(
                              color: listOfColors[random.nextInt(3)],
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}