import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_job_portal/login.dart';
import 'package:flutter_job_portal/settings.dart';
import 'package:flutter_job_portal/ui/home_page.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Resume extends StatelessWidget {
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

  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController institute = TextEditingController();
  TextEditingController male= TextEditingController();
  TextEditingController dateofbirth = TextEditingController();


  var name;
  var e_mail;
  var passwor;
  var Loc;
  var ph;
  var deg;
  var ins;
  var mal;
  var dob;






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
                "Create Resume",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                            image: AssetImage('assets/as.jpg'),
                             )),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
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
              TextField(
                controller: dateofbirth,
                decoration: InputDecoration(

                  labelText: "Date of Birth",
                  filled: false,

                ),

              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     TextButton(
              //         onPressed: () {
              //           DatePicker.showDatePicker(context,
              //               showTitleActions: true,
              //               minTime: DateTime(1995, 3, 5),
              //               maxTime: DateTime(2022, 5, 30),
              //               theme: DatePickerTheme(
              //                   headerColor: Colors.green,
              //                   backgroundColor: Colors.white70,
              //                   itemStyle: TextStyle(
              //                       color: Colors.black,
              //                       fontWeight: FontWeight.normal,
              //                       fontSize: 18),
              //                   doneStyle:
              //                   TextStyle(color: Colors.black, fontSize: 16)),
              //               onChanged: (date) {
              //                 print('change $date in time zone ' +
              //                     date.timeZoneOffset.inHours.toString());
              //               }, onConfirm: (date) {
              //                 print('confirm $date');
              //               }, currentTime: DateTime.now(), locale: LocaleType.en);
              //         },
              //         child: Text(
              //           'Date Of Birth',
              //           textAlign: TextAlign.right,
              //           style: TextStyle(color: Colors.black),
              //         )),
              //   ],
              // ),



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
                      dob=dateofbirth.text;
                      FirebaseFirestore.instance.collection('userprofile').add({'name':'$name','e_mail':'$e_mail','ph':'$ph','deg':'$deg','ins':'$ins','dob':'$dob'});
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Saved"),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text('Ok'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          }
                          );
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
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