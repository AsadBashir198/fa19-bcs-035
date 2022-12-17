import 'package:flutter/material.dart';
import 'package:flutter_job_portal/autication.dart';
import 'package:flutter_job_portal/si.dart';
import 'package:flutter_job_portal/ui/home_page.dart';


class abc extends StatefulWidget {
  @override
  State<abc> createState() => _abcState();
}

class _abcState extends State<abc> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Email',
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
                  SizedBox(height: 20,),

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
