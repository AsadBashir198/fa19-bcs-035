import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CheckboxScreen());
}
class CheckboxScreen extends StatefulWidget {
  @override
  _CheckboxScreenState createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen> {
  List<String> cvtrack1 = ['Submission', 'Screening', 'Evaluation', 'Shortlisted',];
  List<bool> checkedValues = List<bool>.filled(7, false); // Initialize all checkboxes as unchecked

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cv_Status'),
      ),
      body: ListView.builder(
        itemCount: cvtrack1.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(cvtrack1[index]),
            value: checkedValues[index],
            onChanged: (bool value) {
              setState(() {
                checkedValues[index] = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uploadDataToFirestore();
        },
        child: Icon(Icons.cloud_upload),
      ),
    );
  }

  void uploadDataToFirestore() {
    CollectionReference weekdaysCollection = FirebaseFirestore.instance.collection('cvtrack1');
    DocumentReference weekdays1Document = weekdaysCollection.doc('resume5');

    List<String> selectedDays = [];
    for (int i = 0; i < cvtrack1.length; i++) {
      if (checkedValues[i]) {
        selectedDays.add(cvtrack1[i]);
      }
    }

    weekdays1Document.set({'procedure': selectedDays}).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data uploaded successfully')));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error uploading data: $error')));
    });
  }
}
