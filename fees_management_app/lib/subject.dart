import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'm_homepage.dart';


class subject extends StatelessWidget {
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
  TextEditingController subjectname = TextEditingController();
  TextEditingController clas = TextEditingController();



  var s_name;
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
                "Add Subject",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),


              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: subjectname,
                decoration: InputDecoration(

                  labelText: "Subject_Name",
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
                      s_name=subjectname.text;

                      cla=clas.text;


                      FirebaseFirestore.instance.collection('feesdb').add({'ClassName':'$s_name',
                        'Room No':'$cla',
                   });
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Subject Added"),
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
                      "Add Subject",
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