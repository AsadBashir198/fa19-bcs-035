import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class CheckboxScreen extends StatefulWidget {
  @override
  _CheckboxScreenState createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  bool _isChecked = false;
  DatabaseReference _databaseReference =
  FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkbox with Firebase'),
      ),
      body: Center(
        child: CheckboxListTile(
          title: Text('Checkbox'),
          value: _isChecked,
          onChanged: (bool value) {
            setState(() {
              _isChecked = value ?? false;
              _updateCheckboxValue(_isChecked);
            });
          },
        ),
      ),
    );
  }

  void _updateCheckboxValue(bool isChecked) {
    _databaseReference
        .child('checkbox_value')
        .set({'isChecked': isChecked})
        .then((_) {
      print('Checkbox value updated successfully.');
    }).catchError((error) {
      print('Error while updating checkbox value: $error');
    });
  }
}
