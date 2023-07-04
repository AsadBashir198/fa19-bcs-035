import 'package:flutter/material.dart';
import 'package:flutter_job_portal/firebase/autication.dart';
import 'package:flutter_job_portal/jobseeker/si.dart';
import 'package:flutter_job_portal/jobseeker/home_page.dart';

import '../admin/forpass.dart';
import 'forgetPUSer.dart';


class abc extends StatefulWidget {
  @override
  State<abc> createState() => _abcState();
}

class _abcState extends State<abc> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  OutlineInputBorder myinputborder(){ //return type is OutlineInputBorder
    return OutlineInputBorder( //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Color(0xFF4BA5A5),
          width: 4,
        )

    );
  }

  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.greenAccent,
          width: 3,
        )
    );
  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          color: Color(0xFF031047),

          child: Padding(
              padding: const EdgeInsets.only(top:170),
              child: ListView(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        'CU Jobs',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      )),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 20,color:Colors.white),
                      )),
                  Column(
                    children: [
                      TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                            labelText: "Username",
                            prefixIcon: Icon(Icons.people,color: Color(0xFF4BA5A5),),
                            border: myinputborder(),
                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          )
                      ),

                      Container(height:20),

                      TextField(
                          obscureText: true,
                          controller: passwordController,
                          decoration: InputDecoration(
                            filled: true, //<-- SEE HERE
                            fillColor: Colors.white,
                            prefixIcon: Icon(Icons.lock,color: Color(0xFF4BA5A5),),
                            labelText: "Password",

                            enabledBorder: myinputborder(),
                            focusedBorder: myfocusborder(),
                          )
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10,0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          AuthenticationHelper()
                              .signIn(email: nameController.text, password: passwordController.text)
                              .then((result) {
                            if (result == null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Homepage()),
                              );
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
                      )
                  ),
                  TextButton(
                    onPressed: () {
                      //forgot password screen
                      Navigator.push(
                        context, MaterialPageRoute(builder: (context) => forgetUser()),
                      );

                    },
                    child: const Text('Forgot Password',),
                  ),

                  Row(
                    children: <Widget>[
                      SizedBox(
                         height: 10,
                      ),
                      const Text('Does not have account?',
                          style: TextStyle(color: Colors.white) ),
                      SizedBox(width: 70,),
                      TextButton(
                        child: const Text(
                          'Sign up',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyStatefulWidget()),
                          );
                          //signup screen
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
