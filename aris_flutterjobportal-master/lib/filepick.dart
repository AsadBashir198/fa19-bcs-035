import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;

class PdfUploadScreen extends StatefulWidget {
  @override
  _PdfUploadScreenState createState() => _PdfUploadScreenState();
}

class _PdfUploadScreenState extends State<PdfUploadScreen> {
  File selectedPdf;

  Future<void> selectPdfFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedPdf = File(result.files.single.path);
      });
    }
  }

  Future<void> uploadPdfToFirebase() async {
    if (selectedPdf == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('No PDF Selected'),
          content: Text('Please select a PDF file first.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      return;
    }

    String fileName = path.basename(selectedPdf.path);
    Reference firebaseStorageRef =
    FirebaseStorage.instance.ref().child('pdfs/$fileName');

    try {
      await firebaseStorageRef.putFile(selectedPdf);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Upload Successful'),
          content: Text('PDF file uploaded to Firebase Storage.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
    } on FirebaseException catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Upload Failed'),
          content: Text('An error occurred while uploading the PDF file.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      );
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Upload'),
        backgroundColor: Color(0xFF031047),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/screenshots/uplo.jpg',),
            SizedBox(height: 32.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4BA5A5),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.file_upload, size: 24),
                  SizedBox(width: 8.0),
                  Text(
                    'Select PDF File',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onPressed: selectPdfFile,
            ),
            SizedBox(height: 16.0),
            if (selectedPdf != null)
              Column(
                children: [
                  Text(
                    'Selected PDF:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${path.basename(selectedPdf.path)}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  SizedBox(height: 16.0),
                ],
              ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF4BA5A5),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.cloud_upload, size: 24),
                  SizedBox(width: 8.0),
                  Text(
                    'Upload to Firebase',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
              onPressed: uploadPdfToFirebase,
            ),
          ],
        ),
      ),
    );
  }
}
