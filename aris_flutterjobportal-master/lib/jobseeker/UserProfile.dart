import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_job_portal/login.dart';
import 'package:flutter_job_portal/ui/settings.dart';
import 'package:flutter_job_portal/jobseeker/home_page.dart';
import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';

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
  File pickedImage;

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4BA5A5),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4BA5A5),
                       ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF4BA5A5),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController degree = TextEditingController();
  TextEditingController institute = TextEditingController();
  TextEditingController male = TextEditingController();
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
        centerTitle: true,
        title: const Text('user profile'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Container(

                  margin: EdgeInsets.only(left:10 , top:0, right: 10, bottom:0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 6),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(100),
                    ),
                  ),
                  child: ClipOval(
                    child: pickedImage != null
                        ? Image.file(
                            pickedImage,
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: imagePickerOption,
                    icon: const Icon(
                      Icons.add_a_photo_rounded,
                      color: Color(0xFF4BA5A5),
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: ElevatedButton.icon(
                onPressed: imagePickerOption,
                icon: const Icon(Icons.add_a_photo_sharp),
                label: const Text('UPLOAD IMAGE'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4BA5A5),
              ),
            ),
          ),


          Container(
            margin: EdgeInsets.only(left:10 , top:0, right: 10, bottom:50),
            child: Column(
              children: [
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
                TextField(
                  controller: institute,
                  decoration: InputDecoration(
                    labelText: "company name",
                    filled: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: institute,
                  decoration: InputDecoration(
                    labelText: "Experience",
                    filled: false,
                  ),
                ),
                SizedBox(
                  height: 20,
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
                  height: 10,
                ),
                TextField(
                  controller: dateofbirth,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                    filled: false,
                  ),
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
                      color: const Color(0xFF4BA5A5),
                      padding: EdgeInsets.symmetric(horizontal: 60),
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

        ],

      ),
    );

   /* return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF031047),
        elevation: 1,
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






            ],
          ),
        ),
      ),

    );*/
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
