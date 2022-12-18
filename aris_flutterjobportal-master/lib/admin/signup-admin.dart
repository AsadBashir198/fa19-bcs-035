import 'package:flutter/material.dart';
import 'package:flutter_job_portal/jobseeker/abc.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';
import 'package:flutter_job_portal/firebase/autication.dart';
import 'package:flutter_job_portal/admin/login-admin.dart';
import 'package:flutter_job_portal/jobseeker/home_page.dart';

class signupAd extends StatefulWidget {

  @override
  State<signupAd> createState() => _signupAdState();
}

class _signupAdState extends State<signupAd> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: Colors.white,
        body:  Container(
          color: Color(0xFF031047),


          child: Padding(
              padding: const EdgeInsets.only(top:170),
              child: ListView(
                children: <Widget>[
                  Container(

                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'CU Jobs',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign up as Admin',

                        style: TextStyle(fontSize: 20,color:Colors.white),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Sign Up'),
                      onPressed: () {
                        AuthenticationHelper()
                            .signUp(email: nameController.text, password: passwordController.text)
                            .then((result) {
                          if (result == null) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => homeadmin()));
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                result,
                                style: TextStyle(fontSize: 16),
                              ),
                            ));
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4BA5A5),
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: <Widget>[
                      SizedBox(width: 200,),

                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => loginAd()));
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
