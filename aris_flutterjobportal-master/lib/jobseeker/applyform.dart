import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_job_portal/filepick.dart';
import 'package:flutter_job_portal/ui/settings.dart';
import 'package:flutter_job_portal/jobseeker/home_page.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';


class apply extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Apply Form",
      home: ApplyformU(),
    );
  }
}

class ApplyformU extends StatefulWidget {

  @override

  _ApplyformUState createState() => _ApplyformUState();
}

class _ApplyformUState extends State<ApplyformU> {
  final sn=FirebaseFirestore.instance.collection('applyform').snapshots();

  TextEditingController names = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController post = TextEditingController();

  var com;
  var name;
  var e_mail;
  var j_post;
  var addr;
  var ph;




  bool showPassword = false;
  String dropdownvalue = 'Male';

  // List of items in our dropdown menu
  // var gender = [
  //   'Male',
  //   'Female',
  //   'Other',
  //
  // ];
  // DateTime _dateTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Apply '),
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
      body: Container(

        padding: EdgeInsets.only(left: 16, top: 10, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(

            children: [

              Text(
                "Please Fill the Necessary fields",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),


              SizedBox(
                height: 10,
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
                controller: post,
                decoration: InputDecoration(

                  labelText: "job_name",
                  filled: false,

                ),

              ),

              TextFormField(
                controller: address,
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
                controller: company,
                decoration: InputDecoration(

                  labelText: "Company",
                  filled: false,

                ),

              ),

              // TextField(
              //
              //   controller: institute,
              //   decoration: InputDecoration(
              //
              //     labelText: "Institute",
              //     filled: false,
              //
              //   ),
              //
              // ),


              // DropdownButtonFormField(
              //
              //
              //   // Initial Value
              //   value: dropdownvalue,
              //
              //
              //   // Down Arrow Icon
              //   icon: const Icon(Icons.keyboard_arrow_down),
              //
              //   // Array list of items
              //   items: gender.map((String items) {
              //     return DropdownMenuItem(
              //       value: items,
              //       child: Text(items),
              //     );
              //   }).toList(),
              //   // After selecting the desired option,it will
              //   // change button value to selected value
              //   onChanged: (String newValue) {
              //     setState(() {
              //       dropdownvalue = newValue;
              //     });
              //   },
              // ),
              SizedBox(
                height: 20,
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
              //                   headerColor:  Color(0xFF4BA5A5),
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




              ElevatedButton(
                onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  PdfUploadScreen()),
                    );
                },

                child: Text(
                  'Upload your Cv',
                  style: TextStyle(color: Colors.black,fontSize: 18,),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 40),
                  elevation: 5,
                  primary: Colors.transparent,
                  shadowColor: Colors.transparent.withOpacity(0.1),
                  side: BorderSide(
                    width: 3,
                    color: Color(0xFF4BA5A5),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
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
                      com=company.text;
                      addr=address.text;
                      j_post=post.text;

                      ph=phone.text;

                      FirebaseFirestore.instance.collection('applyform').add({'name':'$name',
                        'e_mail':'$e_mail','ph':'$ph','company':'$com','address':'$addr','post':'$j_post'});
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
                    color:  Color(0xFF4BA5A5),
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
                  ),

                ],
              )
            ],
          ),
        ),
      ),

    );
  }


}