import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_job_portal/admin/trackAdm.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class PDFScreen extends StatelessWidget {
  final CollectionReference pdfCollection =
  FirebaseFirestore.instance.collection('pdf');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CV's"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: pdfCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data.docs.isEmpty) {
            return Text('No PDFs found.');
          }
          return ListView(
            children: snapshot.data.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
              document.data() as Map<String, dynamic>;
              String pdfName = data['name'];
              String pdfUrl = data['url'];

              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: InkWell(
                  onTap: () {
                    _openPDF(context, pdfUrl, pdfName);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            pdfName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.download),
                          onPressed: () {
                            _downloadPDF(context, pdfUrl, pdfName);
                          },
                        ),

                        IconButton(
                          icon: Icon(Icons.art_track),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CheckboxScreen(
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  Future<void> _downloadPDF(
      BuildContext context, String pdfUrl, String pdfName) async {
    try {
      var response = await http.get(Uri.parse(pdfUrl));
      var tempDir = await getTemporaryDirectory();
      var filePath = '${tempDir.path}/$pdfName';
      File pdfFile = File(filePath);
      await pdfFile.writeAsBytes(response.bodyBytes);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('PDF Downloaded: $pdfName'),
        ),
      );
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _openPDF(
      BuildContext context, String pdfUrl, String pdfName) async {
    try {
      var response = await http.get(Uri.parse(pdfUrl));
      var tempDir = await getTemporaryDirectory();
      var filePath = '${tempDir.path}/$pdfName';
      File pdfFile = File(filePath);
      await pdfFile.writeAsBytes(response.bodyBytes);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewer(
            filePath: filePath,
          ),
        ),
      );
    } catch (e) {
      print('Error: $e');
    }
  }
}

class PDFViewer extends StatelessWidget {
  final String filePath;

  const PDFViewer({Key key, this.filePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: PDFView(
        filePath: filePath,
      ),
    );
  }
}
