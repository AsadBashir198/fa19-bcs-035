import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_job_portal/admin/HomeAdmin.dart';
import 'package:flutter_job_portal/ui/settings.dart';
import 'package:flutter_job_portal/jobseeker/home_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class employer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Setting UI",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override

  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {


  String dropdownvalue = 'Item 1';
  String dropdownvalue1 = 'sales';
  String dropdownvalue2 = 'govt';
  String dropdownvalue3 = '1 year';
  // List of items in our dropdown menu
  var Department = [
    'sales',
    'Quality control',
    'management',
  ];
  var Category = [
    'govt',
    'Private',
  ];
  var experience = [
    '1 year',
    '2 year',
  ];

  AndroidNotificationChannel channel;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;



  TextEditingController company = TextEditingController();
  TextEditingController designation = TextEditingController();
  TextEditingController Contact = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController vacancies = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController minsalary= TextEditingController();
  TextEditingController maxsalary = TextEditingController();
  TextEditingController startdate = TextEditingController();
  TextEditingController lastdate = TextEditingController();
  TextEditingController testdate = TextEditingController();
  TextEditingController interviewdate = TextEditingController();
  TextEditingController jobtitle = TextEditingController();
  var jotitle;
  var test_dat;
  var intrerviewedate;
  var com;
  var desi;
  var con;
  var addr;
  var qual;
  var vac;
  var desc;
  var minsa;
  var maxsa;
  var l_date;
  var s_date;
  bool showPassword = false;
  @override


  void initState() {
    super.initState();
    // FirebaseMessaging.onMessage.listen((message) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(message.notification!.body.toString()),
    //     duration: Duration(seconds: 10),
    //   ),
    //   );
    // });
    // FirebaseMessaging.onMessageOpenedApp.listen((message) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(message.data['name'].toString()),
    //     duration: Duration(seconds: 10),
    //   ),
    //   );
    // });
    requestPermission();
    loadFCM();
    listenFCM();
    getToken();
    FirebaseMessaging.instance.subscribeToTopic('Flutter');
  }

  void sendPushmessage(String title,String body)async{
    print("call");
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=AAAAyw0n7o4:APA91bFJl0b84aD2ktJouW5GlCpZK6JkcR8qGimmf9ENt3vQ8rO6v1M4uu7i3fxgLQcDVtKVUKoa81AfTkKOuX6HX4O19qCebF_98LqxwCisZQZg43CRet06UMpFJAofra1ZpR-hOEaR',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': body,
              'title': title
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            "to": "/topics/Flutter",
          },
        ),
      );
    } catch (e) {
      print("error push notification");
    }
  }
  void getToken()async{
    await FirebaseMessaging.instance.getToken().then((token) =>print(token) );
  }
  void requestPermission()async{
    FirebaseMessaging messaging=FirebaseMessaging.instance;

    NotificationSettings setting=await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true
    );
    if(setting.authorizationStatus==AuthorizationStatus.authorized){
      print('User granted permission');
    }
    else if(setting.authorizationStatus==AuthorizationStatus.provisional){
      print("User granted provisional permission");
    }
    else{
      print("User denied or not accept permission");
    }
  }
  void listenFCM()async{
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,

              // TODO add a proper drawable resource to android, for now using
              //      one that already exists in example app.
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
  }
  void loadFCM()async{
    if (!kIsWeb) {
      channel = const AndroidNotificationChannel(
        'high_importance_channel', // id
        'High Importance Notifications', // title// description
        importance: Importance.high,
        enableVibration: true,
      );

      flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Post Job'),
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 10, right: 16,bottom:20,),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(

            children: [

              Text(
                "Want to hire? Tell us about your organization",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),


              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller:jobtitle,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Job_Title",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),

              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: company,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Company",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),

              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller:designation,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Designation",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),

              ),
              SizedBox(height: 10),
              TextFormField(
                controller: Contact,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Contact",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),

              ),
              SizedBox(height: 10),
              TextFormField(
                controller: address,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Address",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),

              ),
              SizedBox(height: 10),
              TextFormField(
                controller: qualification,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Qualification",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),

              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: vacancies,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Vacancies",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),


              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: description,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),
              ),
              SizedBox(height: 10,),

              TextFormField(
                controller: minsalary,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Min_Salary",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),

              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller:maxsalary,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Max_Salary",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                    BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: startdate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "start_date",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),
                onTap: () async {
                  DateTime selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      startdate.text = selectedDate.toString().split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: lastdate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "last_Date",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),
                onTap: () async {
                  DateTime selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      lastdate.text = selectedDate.toString().split(' ')[0];
                    });
                  }
                },
              ),


              SizedBox(height: 10,),
              TextFormField(
                controller: testdate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "test_date",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),
                onTap: () async {
                  DateTime selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      testdate.text = selectedDate.toString().split(' ')[0];
                    });
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: interviewdate,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "interview_date",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Icon(
                    Icons.title,
                    color: const Color(0xFF4BA5A5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 3, color: const Color(0xFF4BA5A5)),
                  ),
                ),
                onTap: () async {
                  DateTime selectedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (selectedDate != null) {
                    setState(() {
                      interviewdate.text = selectedDate.toString().split(' ')[0];
                    });
                  }
                },
              ),


              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  homeadmin()),
                      );

                    },

                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      jotitle=jobtitle.text;
                      intrerviewedate=interviewdate.text;
                      test_dat=testdate.text;
                      com=company.text;
                      desi=designation.text;
                      con=Contact.text;
                      addr=address.text;
                      qual=qualification.text;
                      vac=vacancies.text;
                      desc=description.text;
                      minsa=minsalary.text;
                      maxsa=maxsalary.text;
                      l_date=lastdate.text;
                      s_date=startdate.text;
                      FirebaseFirestore.instance.collection('jobpost').add({'company':'$com','designation':'$desi',
                        'contact':'$con','address':'$addr','qualification':'$qual','vacancies':'$vac',
                        'description':'$desc','min salary':'$minsa','max salary':'$maxsa','l_date':'$l_date','s_date':'$s_date',
                        'test_date':'$test_dat','interviewdate':'$intrerviewedate','jobtitle':'$jotitle'});
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Job Posted"),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          });

                      //send notification
                      if(jobtitle.text.isNotEmpty&&company.text.isNotEmpty){
                        sendPushmessage(jobtitle.text, company.text);

                        FirebaseFirestore.instance.collection('message').add({
                          'title':jobtitle.text,
                          'body':company.text,
                        });
                        FirebaseFirestore.instance.collection('Notification').doc(FirebaseAuth.instance.currentUser.uid).collection('message').add({
                          'title':jobtitle.text,
                          'body':company.text,
                        });
                        company.clear();
                        jobtitle.clear();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Message send Successfully"),
                          duration: Duration(seconds: 5),
                        ),
                        );
                      }
                      else{
                        const snackBar = SnackBar(
                          content: Text('Please fill all data'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    color: const Color(0xFF4BA5A5),

                    padding: EdgeInsets.symmetric(horizontal: 45),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Post Job",
                      style: TextStyle(
                          fontSize: 12,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),

    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
              onPressed: () {
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: Icon(
                Icons.remove_red_eye,
                color: Colors.grey,
              ),
            )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}