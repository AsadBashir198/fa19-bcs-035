import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';
import 'package:flutter_job_portal/ui/settings.dart';
import 'package:flutter_job_portal/jobseeker/home_page.dart';
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
                controller: company,
                decoration: InputDecoration(

                  labelText: "Company",
                  filled: false,

                ),

              ),
              TextFormField(
                controller: designation,
                decoration: InputDecoration(

                  labelText: "Designation",
                  filled: false,

                ),

              ),
              TextFormField(
                controller: Contact,
                decoration: InputDecoration(

                  labelText: "Contact",
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
              TextFormField(
                controller: qualification,
                decoration: InputDecoration(

                  labelText: "Qualification",
                  filled: false,

                ),

              ),
              TextFormField(
                controller: vacancies,
                decoration: InputDecoration(

                  labelText: "Vacancies",
                  filled: false,

                ),

              ),
              TextFormField(
                controller: description,
                decoration: InputDecoration(

                  labelText: "Description",
                  filled: false,

                ),

              ),
              TextFormField(
                controller: minsalary,
                decoration: InputDecoration(

                  labelText: "Min_Salary",
                  filled: false,

                ),

              ),







              SizedBox(height: 20.0),
              TextFormField(
                controller:maxsalary,
                decoration: InputDecoration(

                  labelText: "Max_Salary",
                  filled: false,

                ),

              ),
              TextFormField(
                controller:lastdate,
                decoration: InputDecoration(

                  labelText: "last_date",
                  filled: false,

                ),

              ),
              DropdownButtonFormField(
                hint: Text("Select Department"),



                // Initial Value
                value: dropdownvalue1,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: Department.map((String items) {
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
                height: 25,
              ),
              DropdownButtonFormField(


                // Initial Value
                value: dropdownvalue2,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: Category.map((String items) {
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
              SizedBox(height: 25.0,),
              DropdownButtonFormField(


                // Initial Value
                value: dropdownvalue3,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: experience.map((String items) {
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
                height: 25,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     TextButton(
              //
              //         onPressed: () {
              //
              //           DatePicker.showDatePicker(context,
              //               showTitleActions: true,
              //               minTime: DateTime(1995, 3, 5),
              //               maxTime: DateTime(2022, 5, 30),
              //               theme: DatePickerTheme(
              //
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
              //           'Start Date',
              //           textAlign: TextAlign.right,
              //           style: TextStyle(color: Colors.black),
              //         )),
              //   ],
              // ),
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
              //           'Last Date',
              //           textAlign: TextAlign.right,
              //           style: TextStyle(color: Colors.black),
              //         )),
              //   ],
              // ),
              TextFormField(
                controller:lastdate,
                decoration: InputDecoration(

                  labelText: "last_date",
                  filled: false,

                ),

              ),
              TextFormField(
                controller:startdate,
                decoration: InputDecoration(

                  labelText: "last_date",
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
                        'description':'$desc','min salary':'$minsa','max salary':'$maxsa','l_date':'$l_date','s_date':'$s_date'});
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
                    },
                    color: Colors.green,
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