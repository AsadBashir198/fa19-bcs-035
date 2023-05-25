import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';



class resume1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: cv_home(),
    );
  }
}

class cv_home extends StatefulWidget {
  @override
  _cv_homeState createState() => _cv_homeState();
}

class _cv_homeState extends State<cv_home> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();



  
  final TextEditingController fileNameController = TextEditingController();
  String resultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
            ),
            TextField(
              controller: fileNameController,
              decoration: InputDecoration(labelText: 'File Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                generatePDF();
              },
              child: Text('Generate PDF'),
            ),
            SizedBox(height: 20),
            Text(resultMessage),
          ],
        ),
      ),
    );
  }

  Future<void> generatePDF() async {
    final pdf = pw.Document();

    final name = nameController.text;
    final email = emailController.text;
    final phone = phoneController.text;
    final fileName = fileNameController.text.isNotEmpty ? fileNameController.text : 'user_details';

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Name: $name', style: pw.TextStyle(fontSize: 18)),
                pw.SizedBox(height: 10),
                pw.Text('Email: $email', style: pw.TextStyle(fontSize: 18)),
                pw.SizedBox(height: 10),
                pw.Text('Phone: $phone', style: pw.TextStyle(fontSize: 18)),
              ],
            ),
          );
        },
      ),
    );

    final directory = await getExternalStorageDirectory();
    final file = File('${directory?.path}/$fileName.pdf');
    await file.writeAsBytes(await pdf.save());

    setState(() {
      resultMessage = 'PDF saved to: ${file.path}';
    });
  }
}