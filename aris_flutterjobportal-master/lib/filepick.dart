import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job_portal/jobseeker/alljob.dart';
import 'package:iconsax/iconsax.dart';

import 'jobseeker/home_page.dart';
class filepicker extends StatelessWidget {
  const filepicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'File Upload',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const filepickercl(),
    );
  }
}

class filepickercl extends StatefulWidget {
  const filepickercl({
    Key key,
  }) : super(key: key);

  @override
  State<filepickercl> createState() => _filepickerclState();
}

class _filepickerclState extends State<filepickercl>with SingleTickerProviderStateMixin {



  final  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  Future<String>uploadpdf(String fileName,File file) async {
    final reference = FirebaseStorage.instance.ref().child(
        "pdfs/$fileName.pdf");
    final uploadTask = reference.putFile(file);
    await uploadTask.whenComplete(() {});
    final downloadLink = await reference.getDownloadURL();
    return downloadLink;
  }


  void pickFile() async{
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (pickedFile != null){
      String fileName = pickedFile.files[0].name;
      File file = File(pickedFile.files[0].path);

      final downloadLink=await uploadpdf(fileName,file);
      await _firebaseFirestore.collection('pdf').add({
        "name":fileName,
        "url":downloadLink,

      });
      print("pdf uploaded successfully");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text('CU Jobs'),
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
                  MaterialPageRoute(builder: (context) =>  alljobs()),
                );
              }
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(
                height: 100,
              ),
          Image.asset('assets/screenshots/uplo.jpg'),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Upload your file',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'File should be pdf',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
          ElevatedButton(
            onPressed: () {
              pickFile();
              print('Button pressed!');
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>( Color(0xFF4BA5A5),),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Upload cv ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),

              const SizedBox(
                height: 20,
              ),



            ],
          ),
        )

    );
  }
}
