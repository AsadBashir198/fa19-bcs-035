import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/jobseeker/abc.dart';
import 'package:get/get.dart';
import 'admin/login-admin.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: splash1(),
    ),
  ));
}

class splash1 extends StatefulWidget {
  @override
  _splash1State createState() => _splash1State();
}

class _splash1State extends State<splash1> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () => navigateToNextScreen());
  }

  Future<void> navigateToNextScreen() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      String token = await messaging.getToken();
      print('FCM Token: $token');
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/screenshots/jlogo.png',
        height: MediaQuery.of(context).size.width / 1.5,
        width: MediaQuery.of(context).size.width / 1.5,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something Went Wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        return WillPopScope(
          onWillPop: () async {
            return false; // Disable the back button
          },
          child: Container(
            color: Colors.white,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData.light(),
              home: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xFF4BA5A5),
                      radius: 140,
                      child: CircleAvatar(
                        radius: 130,
                        backgroundImage: AssetImage(
                          'assets/screenshots/COMSATS_new_logo.jpg',
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                      child: Text(
                        "Login As a ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          inherit: false,
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      child: ElevatedButton(
                        child: Text('Admin'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4BA5A5),
                          fixedSize: const Size(200, 50),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                          ),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(2, 4),
                            ),
                          ),
                          shadowColor: Colors.lightBlue,
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => loginAd()),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      child: ElevatedButton(
                        child: Text('Jobseeker'),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF4BA5A5),
                          fixedSize: const Size(200, 50),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                          ),
                          shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.elliptical(2, 4),
                            ),
                          ),
                          shadowColor: Colors.lightBlue,
                        ),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => abc()),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
