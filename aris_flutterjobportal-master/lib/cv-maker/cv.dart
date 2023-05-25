import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

import '../jobseeker/home_page.dart';



class resume1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Make YOur CV',
      theme: ThemeData(

          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: const Color(0xFF031047),
          )),

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

  final TextEditingController degreecontroller = TextEditingController();
  final TextEditingController institutecontroller = TextEditingController();
  final TextEditingController malecontroller= TextEditingController();
  final TextEditingController datedcontroller = TextEditingController();
  final TextEditingController hobbiescontroller = TextEditingController();
  final TextEditingController achievementcontroller = TextEditingController();
  final TextEditingController workexperiencecontroller = TextEditingController();
  final TextEditingController skillscontroller = TextEditingController();






  final TextEditingController fileNameController = TextEditingController();
  String resultMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CV Maker'),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Homepage()),
              );
            }
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Personal Details',
                style: TextStyle(fontSize: 20),
              ),
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
                controller: datedcontroller,
                decoration: InputDecoration(labelText: 'Date of Birth'),
              ),
              TextField(
                controller: malecontroller,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              SizedBox(height: 10),
              Text(
                'Educational Details',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: degreecontroller,
                decoration: InputDecoration(labelText: 'Degree'),
              ),
              TextField(
                controller: institutecontroller,
                decoration: InputDecoration(labelText: 'Institute'),
              ),
              SizedBox(height: 20),
              Text(
                'Other Informations',
                style: TextStyle(fontSize: 20),
              ),

              TextField(
                decoration: InputDecoration(labelText: 'Skills'),
                controller: skillscontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null, // <-- SEE HERE
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Achievements'),
                controller: achievementcontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null, // <-- SEE HERE
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Work Experience'),
                controller: workexperiencecontroller,
                keyboardType: TextInputType.multiline,
                maxLines: null, // <-- SEE HERE
              ),

              TextField(
                controller: fileNameController,
                decoration: InputDecoration(labelText: 'CV_Title'),
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
      ),
    );
  }

  Future<void> generatePDF() async {
    final pdf = pw.Document();

    final name = nameController.text;
    final email = emailController.text;
    final phone = phoneController.text;
    final deg = degreecontroller.text;
    final insti = institutecontroller.text;
    final mal = malecontroller.text;
    final dat = datedcontroller.text;
    final hobie = hobbiescontroller.text;
    final achiev = achievementcontroller.text;
    final w_exp = workexperiencecontroller.text;
    final skill = skillscontroller.text;






    final fileName = fileNameController.text.isNotEmpty ? fileNameController.text : 'user_details';

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Personal Details',style:pw.TextStyle(fontSize: 30)),

                pw.Text('Name: $name',textAlign: pw.TextAlign.left, style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 3),
                pw.Text('Email: $email',textAlign: pw.TextAlign.left, style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 3),
                pw.Text('Gender: $mal', textAlign: pw.TextAlign.left,style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 3),
                pw.Text('Phone: $phone',textAlign: pw.TextAlign.left, style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 3),
                pw.SizedBox(height: 3),
                pw.Text('Date of Birth: $dat',textAlign: pw.TextAlign.left, style: pw.TextStyle(fontSize: 20)),

                pw.Text('Education Details',style:pw.TextStyle(fontSize: 30)),

                pw.Text('Degree: $deg',textAlign: pw.TextAlign.left, style: pw.TextStyle(fontSize: 20)),
                pw.SizedBox(height: 3),
                pw.Text('Institute: $insti', textAlign: pw.TextAlign.left,style: pw.TextStyle(fontSize: 20)),


                pw.Text('Achievements ',style:pw.TextStyle(fontSize: 30)),
                pw.SizedBox(height: 3),
                pw.Text('Achievements: $achiev',textAlign: pw.TextAlign.left, style: pw.TextStyle(fontSize: 20)),


                pw.Text('Work Experience',style:pw.TextStyle(fontSize: 30)),
                pw.SizedBox(height: 3),
                pw.Text('Work_Experience: $w_exp', textAlign: pw.TextAlign.left,style: pw.TextStyle(fontSize: 20)),

                pw.Text('Hobbies',style:pw.TextStyle(fontSize: 30)),
                pw.SizedBox(height: 3),
                pw.Text('Hobbies: $hobie', textAlign: pw.TextAlign.left,style: pw.TextStyle(fontSize: 20)),

                pw.Text('skills',style:pw.TextStyle(fontSize: 30)),
                pw.SizedBox(height: 3),
                pw.Text('skills: $skill', textAlign: pw.TextAlign.left,style: pw.TextStyle(fontSize: 20,)),


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
