import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'm_homepage.dart';


class student extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Fees App",
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override

  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {



  // List of items in our dropdown menu






  TextEditingController name = TextEditingController();
  TextEditingController Contact = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController subject = TextEditingController();
  TextEditingController clas = TextEditingController();

  var nam;
  var con;
  var addr;
  var qual;
  var emai;
  var subj;
  var cla;

  bool showPassword = false;






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Fees App Management",
      ),

        backgroundColor: Colors.blueGrey,
        elevation: 1,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  m_homepage()),
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
                "Student Records",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),


              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(

                  labelText: "Name",
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
                controller: email,
                decoration: InputDecoration(

                  labelText: "Email",
                  filled: false,

                ),

              ),
              TextFormField(
                controller: subject,
                decoration: InputDecoration(

                  labelText: "Subject",
                  filled: false,

                ),

              ),
              TextFormField(
                controller: clas,
                decoration: InputDecoration(

                  labelText: "Class",
                  filled: false,

                ),

              ),









              SizedBox(height: 0.0,),




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
                        MaterialPageRoute(builder: (context) => m_homepage()),
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
                      nam=name.text;

                      con=Contact.text;
                      addr=address.text;
                      qual=qualification.text;

                      FirebaseFirestore.instance.collection('feesdb').add({'Name':'$nam',
                        'contact':'$con','address':'$addr','qualification':'$qual','Email':'$emai',
                        'Subject':'$subj','Class':'$clas',
                      });
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Student Added"),
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
                      "Add Student",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 0.5,
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