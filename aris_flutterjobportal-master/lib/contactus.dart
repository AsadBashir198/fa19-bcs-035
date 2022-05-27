import 'package:flutter/material.dart';


void main() {
  runApp( ContactUs());
}
class ContactUs extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(backgroundColor: Colors.lightGreen,
        body: SafeArea(child:
        Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            CircleAvatar(backgroundColor: Colors.amber,
              backgroundImage: AssetImage("images/as.jpg"),

              maxRadius: 70.0,
            ),
            Text(
              'ASAD',
              style:TextStyle(
                  height: 2,
                  fontFamily: 'SpecialElite',
                  color: Colors.black,
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
              margin: EdgeInsets.symmetric(vertical: 30,horizontal: 70),
              child: ListTile(
                  leading: Icon(Icons.call),
                  iconColor: Colors.purple,
                  textColor: Colors.black,
                  title:   Text("03099932032")
              ),

            ),

            Card(
              margin: EdgeInsets.symmetric(vertical:0,horizontal: 70),
              child:  ListTile(
                  leading: Icon(Icons.alternate_email_outlined),
                  iconColor: Colors.purple,
                  textColor: Colors.black,
                  title:   Text("Email")
              ),

            ),


            Card(
              margin: EdgeInsets.symmetric(vertical:28,horizontal: 70),
              child: ListTile(
                  leading: Icon(Icons.home_filled),
                  iconColor: Colors.purple,
                  textColor: Colors.black,
                  title:   Text("Address")
              ),

            ),


          ],
        )


        ),

      ),
    );
  }
}
