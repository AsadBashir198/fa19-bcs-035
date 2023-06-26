import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class passwordCh extends StatefulWidget {
  @override
  _passwordChState createState() => _passwordChState();
}

class _passwordChState extends State<passwordCh> {
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Change Password',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'New Password',
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                changePassword(_passwordController.text);
              },
              style: ElevatedButton.styleFrom(
                primary:  const Color(0xFF4BA5A5), // Set the button background color
                onPrimary: Colors.white, // Set the text color
              ),
              child: Text('Change Password'),
            ),

            SizedBox(height: 20.0),
            Text(
              'Change Username (Email)',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'New Email',
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                changeUsername(_emailController.text);
              },
              style: ElevatedButton.styleFrom(
                primary:  const Color(0xFF4BA5A5), // Set the button background color
                onPrimary: Colors.white, // Set the text color
              ),
              child: Text('Change Email'),
            ),
          ],
        ),
      ),
    );
  }

  void changePassword(String newPassword) async {
    User user = FirebaseAuth.instance.currentUser;

    try {
      await user.updatePassword(newPassword);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Password updated successfully!'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },

                child: Text('OK'),
              ),

            ],
          );
        },
      );
      _passwordController.clear();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to update password: $e'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void changeUsername(String newEmail) async {
    User user = FirebaseAuth.instance.currentUser;

    try {
      await user.updateEmail(newEmail);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Email updated successfully!'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      _emailController.clear();
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to update email: $e'),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

void main() {
  runApp(MaterialApp(
    home: passwordCh(),
  ));
}
