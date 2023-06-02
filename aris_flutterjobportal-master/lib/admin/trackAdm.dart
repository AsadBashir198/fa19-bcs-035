import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RadioDataUploader extends StatefulWidget {
  @override
  _RadioDataUploaderState createState() => _RadioDataUploaderState();
}

class _RadioDataUploaderState extends State<RadioDataUploader> {
  List<String> selectedOptions = [];

  void uploadData() {
    FirebaseFirestore.instance.collection('radioB').add({
      'selectedOptions': selectedOptions,
    })
        .then((value) {
      print('Radio button data uploaded successfully');
    })
        .catchError((error) {
      print('Failed to upload radio button data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('track cv'),
      ),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('on its way'),
            value: selectedOptions.contains('Option 1'),
            onChanged: (value) {
              setState(() {
                if (value)
                  selectedOptions.add('Option 1');
                else
                  selectedOptions.remove('Option 1');
              });
            },
          ),
          CheckboxListTile(
            title: Text('delivered'),
            value: selectedOptions.contains('Option 2'),
            onChanged: (value) {
              setState(() {
                if (value)
                  selectedOptions.add('Option 2');
                else
                  selectedOptions.remove('Option 2');
              });
            },
          ),
          CheckboxListTile(
            title: Text('pending'),
            value: selectedOptions.contains('Option 3'),
            onChanged: (value) {
              setState(() {
                if (value)
                  selectedOptions.add('Option 3');
                else
                  selectedOptions.remove('Option 3');
              });
            },
          ),
          CheckboxListTile(
            title: Text('accepted'),
            value: selectedOptions.contains('Option 4'),
            onChanged: (value) {
              setState(() {
                if (value)
                  selectedOptions.add('Option 4');
                else
                  selectedOptions.remove('Option 4');
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              uploadData();
            },
            child: Text('Upload Data'),
          ),
        ],
      ),
    );
  }
}
