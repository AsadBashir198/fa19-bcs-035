import 'package:flutter/material.dart';

import '../admin/HomeAdmin.dart';

void main() {
  runApp(aboutus());
}

class aboutus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp( debugShowCheckedModeBanner: false,
      title: 'Jobs Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AboutScreen(),
    );
  }
}

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Color(0xFF031047),
        centerTitle: true,
        title: Text('About'),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  homeadmin(),),
              );
            }
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CU JOBS',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Version 1.0',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Application Description',
              style: TextStyle(fontSize: 20.0),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              child: Text(
                'Your job search made easy. Find and apply for jobs  in various Comsats University Campuses.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Developer Information',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Asad & Awais Brothers',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            Text(
              'Contact Information',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Email: comsatsuniversity@gmail.com',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 32.0),
            TextButton(
              onPressed: () {
                // Add functionality to open the privacy policy page
              },
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                // Add functionality to open the terms of service page
              },
              child: Text(
                'Terms of Service',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
