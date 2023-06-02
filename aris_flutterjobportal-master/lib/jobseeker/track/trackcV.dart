import 'dart:math';

import 'package:flutter/material.dart';

import '../home_page.dart';





class trackcvuser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CV ',
      theme: ThemeData(
        primaryColor: const Color(0xFF031047),
      ),
      home: TimelineComponent()
    );
  }
}

class TimelineComponent extends StatelessWidget {



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
        ],
      ),
    );
  }
}