// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_job_portal/autication.dart';
// import 'package:flutter_job_portal/ui/home_page.dart';
//
// import 'register.dart';
//
// class MyLogin extends StatefulWidget {
//
//   @override
//   _MyLoginState createState() => _MyLoginState();
// }
//
// class _MyLoginState extends State<MyLogin> {
//   final _formKey = GlobalKeyey<FormState>();
//
//   var email = "";
//   var password = "";
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   userLogin() async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>   Homepage(),
//         ),
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print("No User Found for that Email");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "No User Found for that Email",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       } else if (e.code == 'wrong-password') {
//         print("Wrong Password Provided by User");
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Wrong Password Provided by User",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/login.png'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 130),
//               child: Text(
//                 'Welcome\nBack',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             style: TextStyle(color: Colors.black),
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Email",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             controller: emailController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Email';
//                               } else if (!value.contains('@')) {
//                                 return 'Please Enter Valid Email';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextFormField(
//                             style: TextStyle(),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.grey.shade100,
//                                 filled: true,
//                                 hintText: "Password",
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             controller: passwordController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Password';
//                               }
//                               return null;
//                             },
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Sign in',
//                                 style: TextStyle(
//                                     fontSize: 27, fontWeight: FontWeight.w700),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: Color(0xff4c505b),
//                                 child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () {
//                                       // Validate returns true if the form is valid, otherwise false.
//                                       AuthenticationHelper()
//                                           .signIn(email: email, password: password)
//                                           .then((result) {
//                                         if (result == null) {
//                                           Navigator.pushReplacement(context,
//                                               MaterialPageRoute(builder: (context) => Homepage()));
//                                         } else {
//                                           Scaffold.of(context).showSnackBar(SnackBar(
//                                             content: Text(
//                                               result,
//                                               style: TextStyle(fontSize: 16),
//                                             ),
//                                           ));
//                                         }
//                                       });
//                                     },
//                                     icon: Icon(
//                                       Icons.arrow_forward,
//                                     )),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             height: 40,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TextButton(
//                               onPressed: () {
//                                        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyRegister()),);
//                                        },
//
//                                 child: Text(
//                                   'Sign Up',
//                                   textAlign: TextAlign.left,
//                                   style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18),
//                                 ),
//                                 style: ButtonStyle(),
//                               ),
//                               TextButton(
//                                   onPressed: () {},
//                                   child: Text(
//                                     'Forgot Password',
//                                     style: TextStyle(
//                                       decoration: TextDecoration.underline,
//                                       color: Color(0xff4c505b),
//                                       fontSize: 18,
//                                     ),
//                                   )),
//                             ],
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
