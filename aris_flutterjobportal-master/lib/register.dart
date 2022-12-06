// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_job_portal/autication.dart';
//
// import 'login.dart';
// import 'ui/home_page.dart';
//
// class MyRegister extends StatefulWidget {
//
//
//   @override
//   _MyRegisterState createState() => _MyRegisterState();
// }
//
// class _MyRegisterState extends State<MyRegister> {
//   final _formKey = GlobalKey<FormState>();
//
//   var email = "";
//   var password = "";
//   var confirmPassword = "";
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final emailController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     emailController.dispose();
//     passwordController.dispose();
//     confirmPasswordController.dispose();
//     super.dispose();
//   }
//
//
//   registration() async {
//     if (password == confirmPassword) {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         print(userCredential);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             backgroundColor: Colors.redAccent,
//             content: Text(
//               "Registered Successfully. Please Login..",
//               style: TextStyle(fontSize: 20.0),
//             ),
//           ),
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MyLogin(),
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'weak-password') {
//           print("Password Provided is too Weak");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Password Provided is too Weak",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         } else if (e.code == 'email-already-in-use') {
//           print("Account Already exists");
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.orangeAccent,
//               content: Text(
//                 "Account Already exists",
//                 style: TextStyle(fontSize: 18.0, color: Colors.black),
//               ),
//             ),
//           );
//         }
//       }
//     } else {
//       print("Password and Confirm Password doesn't match");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: Colors.orangeAccent,
//           content: Text(
//             "Password and Confirm Password doesn't match",
//             style: TextStyle(fontSize: 16.0, color: Colors.black),
//           ),
//         ),
//       );
//     }
//   }
//
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/register.png'), fit: BoxFit.cover),
//       ),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 30),
//               child: Text(
//                 'Create\nAccount',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.28),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(left: 35, right: 35),
//                       child: Column(
//                         children: [
//                           TextFormField(
//                             style: TextStyle(color: Colors.white),
//                             decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: "Email",
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//
//                             controller: emailController,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please Enter Email';
//                               } else if (!value.contains('@')) {
//                                 return 'Please Enter Valid Email';
//                               }
//                               return null;
//                             },
//
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextFormField(
//                             style: TextStyle(color: Colors.white),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: " Password",
//                                 hintStyle: TextStyle(color: Colors.white),
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
//
//
//                           ),
//                           SizedBox(
//                             height: 30,
//                           ),
//                           TextFormField(
//                             style: TextStyle(color: Colors.white),
//                             obscureText: true,
//                             decoration: InputDecoration(
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                   borderSide: BorderSide(
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                                 hintText: "Confirm Password",
//                                 hintStyle: TextStyle(color: Colors.white),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 )),
//                             controller: confirmPasswordController,
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
//
//                           Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Already have an Account? "),
//                                 TextButton(
//                                     onPressed: () => {
//                                       Navigator.pushReplacement(
//                                         context,
//                                         PageRouteBuilder(
//                                           pageBuilder:
//                                               (context, animation1, animation2) =>
//                                               MyLogin(),
//                                           transitionDuration: Duration(seconds: 0),
//                                         ),
//                                       )
//                                     },
//                                     child: Text('Login',style:TextStyle(color: Colors.black87,fontSize: 20),))
//                               ],
//                             ),
//                           ),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'Sign Up',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 27,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                               CircleAvatar(
//                                 radius: 30,
//                                 backgroundColor: Color(0xff4c505b),
//                                 child: IconButton(
//                                     color: Colors.white,
//                                     onPressed: () {
//                                       AuthenticationHelper()
//                                           .signUp(email: email, password: password)
//                                           .then((result) {
//                                         if (result == null) {
//                                           Navigator.pushReplacement(context,
//                                               MaterialPageRoute(builder: (context) => MyLogin()));
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
//
//
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
