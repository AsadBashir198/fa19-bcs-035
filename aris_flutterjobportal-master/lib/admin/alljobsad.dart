import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_job_portal/admin/HomeAdmin.dart';
import 'package:flutter_job_portal/admin/searJobs.dart';

class alljobsad extends StatefulWidget {
  @override
  State<alljobsad> createState() => _alljobsadState();
}

class _alljobsadState extends State<alljobsad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Jobs'),
        centerTitle: true,
        backgroundColor: const Color(0xFF031047),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => homeadmin()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchAd()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('jobpost').snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          return ListView.builder(
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, int index) {
              var docid = snapshot.data.docs[index].id;
              return Container(
                padding: EdgeInsets.all(20.0),
                margin: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'company:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Container(
                          child: Text(
                            snapshot.data.docs[index]['company'],
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'vacancies:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 43.0),
                        Container(
                          child: Text(
                            snapshot.data.docs[index]['vacancies'],
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'contact:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 62.0),
                        Container(
                          child: Text(
                            snapshot.data.docs[index]['contact'],
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Qualification:',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 25.0),
                        Container(
                          child: Text(
                            snapshot.data.docs[index]['qualification'],
                            style: TextStyle(fontSize: 14),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController updatedCompanyController = TextEditingController();
                                TextEditingController updatedVacanciesController = TextEditingController();
                                TextEditingController updatedContactController = TextEditingController();
                                TextEditingController updatedQualificationController = TextEditingController();

                                return Dialog(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextField(
                                          controller: updatedCompanyController,
                                          decoration: InputDecoration(labelText: 'Company'),
                                        ),
                                        TextField(
                                          controller: updatedVacanciesController,
                                          decoration: InputDecoration(labelText: 'Vacancies'),
                                        ),
                                        TextField(
                                          controller: updatedContactController,
                                          decoration: InputDecoration(labelText: 'Contact'),
                                        ),
                                        TextField(
                                          controller: updatedQualificationController,
                                          decoration: InputDecoration(labelText: 'Qualification'),
                                        ),
                                        SizedBox(height: 16),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            TextButton(
                                              child: Text('Cancel'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: Text('Update'),
                                              onPressed: () {
                                                String updatedCompany = updatedCompanyController.text;
                                                String updatedVacancies = updatedVacanciesController.text;
                                                String updatedContact = updatedContactController.text;
                                                String updatedQualification = updatedQualificationController.text;

                                                // Define the updated job data
                                                Map<String, dynamic> updatedData = {
                                                  'company': updatedCompany,
                                                  'vacancies': updatedVacancies,
                                                  'contact': updatedContact,
                                                  'qualification': updatedQualification,
                                                };

                                                FirebaseFirestore.instance
                                                    .collection('jobpost')
                                                    .doc(docid) // use the docid variable to specify the document to update
                                                    .update(updatedData)
                                                    .then((value) {
                                                  // Update successful
                                                  Scaffold.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Job post updated successfully.'),
                                                    ),
                                                  );
                                                  Navigator.pop(context); // Close the update dialog
                                                }).catchError((error) {
                                                  // Error occurred while updating
                                                  Scaffold.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('Failed to update job post.'),
                                                    ),
                                                  );
                                                  print('Failed to update job post: $error');
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text('Update'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF4BA5A5),
                          ),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: () {
                            // Delete button logic
                            // Implement your logic to delete the job post
                            FirebaseFirestore.instance
                                .collection('jobpost')
                                .doc(docid) // use the docid variable to specify the document to delete
                                .delete()
                                .then((value) {
                              // Delete successful
                              print('Job post deleted successfully');
                            }).catchError((error) {
                              // Error occurred while deleting
                              print('Failed to delete job post: $error');
                            });
                          },
                          child: Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF4BA5A5),
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                height: 240.0,
              );
            },
          );
        },
      ),
    );
  }
}
