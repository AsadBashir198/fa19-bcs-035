import 'package:flutter/material.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';
import 'package:flutter_job_portal/jobseeker/abc.dart';

import '../admin/chpassword.dart';
import '../admin/social.dart';
import '../ui/contactus.dart';
import 'login-admin.dart';

class settingAdmin extends StatefulWidget {
  @override
  _settingAdminState createState() => _settingAdminState();
}

class _settingAdminState extends State<settingAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              MaterialPageRoute(builder: (context) => homeadmin()),
            );
          },
        ),
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Account',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            buildAccountOptionRow(context, 'Change password', passwordCh()),
            buildAccountOptionRow(context, 'Social', social()),
            buildAccountOptionRow(context, 'About Us', aboutus()),
            SizedBox(height: 20),
            ElevatedButton(  style: ElevatedButton.styleFrom(
              primary:  Color(0xFF4BA5A5),
              onPrimary: Colors.white,
              shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
            ),
              onPressed: () {
                _showLogoutConfirmationDialog(); // Show logout confirmation dialog
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOptionRow(
      BuildContext context, String title, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
                logout(); // Call your logout function
              },
            ),
          ],
        );
      },
    );
  }

  void logout() {
    // Implement your logout logic here
    // For example, clear user session or token

    // Navigate to the login screen
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return loginAd();
        }, transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }),
            (Route route) => false);
  }
}
