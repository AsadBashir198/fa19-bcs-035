import 'package:flutter/material.dart';

class HelpGuideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Guide'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            FaqItem(
              question: 'How do I create a profile?',
              answer:
              'To create a profile, click on the "Create Profile" button and fill in the required information such as your personal details, education, work experience, and skills.',
            ),
            FaqItem(
              question: 'How can I search for job listings?',
              answer:
              'You can search for job listings by clicking on the "Search Jobs" button. Enter keywords, location, or any other relevant criteria to find the desired job opportunities.',
            ),
            FaqItem(
              question: 'How do I apply for a job?',
              answer:
              'To apply for a job, navigate to the job listing and click on the "Apply Now" button. Fill in the application form and attach your resume and other required documents.',
            ),
            SizedBox(height: 24.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('comsatsofficial@gmail.com'),
              onTap: () {
                // Handle email tap
              },
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 (123) 456-7890'),
              onTap: () {
                // Handle phone tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({
     this.question,
     this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Text(answer),
        ),
      ],
    );
  }
}
