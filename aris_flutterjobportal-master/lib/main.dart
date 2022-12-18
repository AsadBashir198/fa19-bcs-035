import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/abc.dart';
import 'package:get/get.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(

      body: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        // Check for Errors
        if (snapshot.hasError) {
          print("Something Went Wrong");
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }


        return MaterialApp(

          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.light(),
          home: SafeArea(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    child: Text('Admin'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4BA5A5),
                        fixedSize: const Size(250,70),
                      // side: BorderSide(color: Colors.yellow, width: 5),
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.elliptical(2,4))),
                      shadowColor: Colors.lightBlue,
                    ),
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>abc())),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    child: Text('Jobseeker'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4BA5A5),
                         fixedSize: const Size(250,70),
                      // side: BorderSide(color: Colors.yellow, width: 5),
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.elliptical(2,4))),
                      shadowColor: Colors.lightBlue,
                    ),
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>abc())),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    child: Text('Employer'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4BA5A5),
                      fixedSize: const Size(250,70),
                      // side: BorderSide(color: Colors.yellow, width: 5),
                      textStyle: const TextStyle(
                          color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.elliptical(2,4))),
                      shadowColor: Colors.lightBlue,
                    ),
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) =>abc())),
                  ),
                ),
              ],
            ),
          ),

        );
      },
    );
  }
}


