import 'package:fees_management_app/student_detail.dart';
import 'package:flutter/material.dart';
import 'package:fees_management_app/login.dart';
import 'package:fees_management_app/autication.dart';


class s_signup extends StatefulWidget {

  @override
  State<s_signup> createState() => _s_signupState();
}

class _s_signupState extends State<s_signup> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  Scaffold(

        body:  Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/back.png'), fit: BoxFit.cover),),

          child: Padding(
              padding: const EdgeInsets.only(top:170),
              child: ListView(
                children: <Widget>[
                  Container(

                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Job Finder App',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 20),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Acedemy_Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
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
                              .signUp(acedemy: nameController.text, password: passwordController.text)
                              .then((result) {
                            if (result == null) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) => s_detail()));
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
                      ),
                  ),
                  Row(
                    children: <Widget>[

                      TextButton(
                        child: const Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                           Navigator.pushReplacement(context,
                                                           MaterialPageRoute(builder: (context) => s_login()));
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
