import 'package:flutter/material.dart';


void main() {
  runApp( ContactUs());
}
class ContactUs extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.black54,
        body: SafeArea(child:
        Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: Colors.blueGrey,
              child: Icon(Icons.person,size: 90),


              maxRadius: 70.0,
            ),
            Text(
              'ASAD',
              style:TextStyle(
                  height: 2,
                  fontFamily: 'SpecialElite',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
            ),
            Text(
              'FLUTTER DEVELOPER',
              style:TextStyle(
                  fontFamily: 'SpecialElite-Regular',
                  color: Colors.white,
                  height: 2.0,
                  fontSize: 25.0),
            ),


            SizedBox(height: 50,
              width: 150,
              child: Divider(
                thickness: 2,
                height: 50,
                color: Colors.black,


              ),
            ),


            Card(
              margin: EdgeInsets.symmetric(vertical: 30,horizontal: 40),
              child: ListTile(
                  leading: Icon(Icons.call),
                  iconColor: Colors.purple,
                  textColor: Colors.black,
                  title:   Text("03099932032")
              ),

            ),

            Card(
              margin: EdgeInsets.symmetric(vertical:0,horizontal: 40),
              child:  ListTile(
                  leading: Icon(Icons.alternate_email_outlined),
                  iconColor: Colors.purple,
                  textColor: Colors.black,
                  title:   Text("asadbashir19832@gmail.com")
              ),

            ),


            Card(
              margin: EdgeInsets.symmetric(vertical:28,horizontal: 40),
              child: ListTile(
                  leading: Icon(Icons.home_filled),
                  iconColor: Colors.purple,
                  textColor: Colors.black,
                  title:   Text("Vehari")
              ),

            ),


          ],
        )


        ),

      ),
    );
  }
}
