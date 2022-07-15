import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_job_portal/login.dart';
import 'package:flutter_job_portal/settings.dart';
import 'package:flutter_job_portal/ui/home_page.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class apply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Apply Form",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {

  @override

  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final sn=FirebaseFirestore.instance.collection('applyform').snapshots();

  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController institute = TextEditingController();
  TextEditingController male= TextEditingController();
  TextEditingController dated = TextEditingController();



  var name;
  var e_mail;

  var Loc;
  var ph;
  var deg;
  var ins;
  var mal;
  var date;



  bool showPassword = false;
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  var gender = [
    'Male',
    'Female',
    'Other',

  ];
  DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Homepage()),
              );
            }
        ),

      ),
      body: Container(

        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(

            children: [

              Text(
                "Apply For Job",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),

              SizedBox(
                height: 30,
              ),
              TextField(
                controller: names,
                decoration: InputDecoration(

                  labelText: "Full Name",
                  filled: false,

                ),

              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(

                  labelText: "E-Mail",
                  filled: false,

                ),

              ),
              SizedBox(
                height: 10,
              ),


              TextFormField(
                controller: location,
                decoration: InputDecoration(

                  labelText: "Address",
                  filled: false,

                ),

              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phone,
                decoration: InputDecoration(

                  labelText: "Phone No",
                  filled: false,

                ),

              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: degree,
                decoration: InputDecoration(

                  labelText: "Degree",
                  filled: false,

                ),

              ),
              SizedBox(
                height: 10,
              ),
              TextField(

                controller: institute,
                decoration: InputDecoration(

                  labelText: "Institute",
                  filled: false,

                ),

              ),
              SizedBox(
                height: 10,
              ),

              DropdownButtonFormField(


                // Initial Value
                value: dropdownvalue,


                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: gender.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String newValue) {
                  setState(() {
                    dropdownvalue = newValue;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                      onPressed: () {
                        DatePicker.showDatePicker(context,
                            showTitleActions: true,
                            minTime: DateTime(1995, 3, 5),
                            maxTime: DateTime(2022, 5, 30),
                            theme: DatePickerTheme(
                                headerColor: Colors.green,
                                backgroundColor: Colors.white70,
                                itemStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18),
                                doneStyle:
                                TextStyle(color: Colors.black, fontSize: 16)),
                            onChanged: (date) {
                              print('change $date in time zone ' +
                                  date.timeZoneOffset.inHours.toString());
                            }, onConfirm: (date) {
                              print('confirm $date');
                            }, currentTime: DateTime.now(), locale: LocaleType.en);
                      },
                      child: Text(
                        'Date Of Birth',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),



              SizedBox(
                height: 35,
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
                        MaterialPageRoute(builder: (context) =>  Homepage()),
                      );

                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      name=names.text;
                      e_mail=email.text;

                      ph=phone.text;
                      deg=degree.text;
                      ins=institute.text;
                      FirebaseFirestore.instance.collection('applyform').add({'name':'$name','e_mail':'$e_mail','ph':'$ph','deg':'$deg','ins':'$ins'});
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Submitted"),
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
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 14,
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


}