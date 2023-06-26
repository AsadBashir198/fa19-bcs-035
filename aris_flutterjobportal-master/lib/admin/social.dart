import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'HomeAdmin.dart';


class social extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Social Accounts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SocialAccountsScreen(),
    );
  }
}

class SocialAccountsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Social Accounts'),
        centerTitle: true,
        backgroundColor: const Color(0xFF031047),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>homeadmin()),
              );
            }
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountTile(
              icon: FlutterIcons.facebook_f_faw,
              accountName: 'Facebook',
              accountID: 'Comsats Official',
            ),
            SizedBox(height: 16.0),
            AccountTile(
              icon: FlutterIcons.instagram_faw,
              accountName: 'Instagram',
              accountID: 'Comsats Official',
            ),
            SizedBox(height: 16.0),
            AccountTile(
              icon: Icons.mail,
              accountName: 'Gmail',
              accountID: 'ComsatsUniversity@gmail.com',
            ),
            SizedBox(height: 16.0),
            AccountTile(
              icon: Icons.phone,
              accountName: 'Phone',
              accountID: '+66-83743-3821',
            ),
          ],
        ),
      ),
    );
  }
}

class AccountTile extends StatelessWidget {
  final IconData icon;
  final String accountName;
  final String accountID;

  const AccountTile({
     this.icon,
     this.accountName,
     this.accountID,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 48.0,
           color: const Color(0xFF4BA5A5),
        ),
        SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              accountName,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              accountID,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ],
    );
  }
}
