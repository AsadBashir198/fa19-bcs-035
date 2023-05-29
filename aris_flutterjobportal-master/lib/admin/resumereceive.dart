import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_pdf_viewer/easy_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(resumeeee());
}

class resumeeee extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Viewer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PDFListScreen(),
    );
  }
}

class PDFListScreen extends StatefulWidget {
  @override
  _PDFListScreenState createState() => _PDFListScreenState();
}

class _PDFListScreenState extends State<PDFListScreen> {


  final  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  List<Map<String,dynamic>>pdfData =[];


  void getAllpdf()  async{
 final results = await _firebaseFirestore.collection("pdfs").get();
 pdfData = results.docs.map((e)=>e.data()).toList();
 setState(() {

 });
  }
  @override
  void initState() {
    super.initState();
    getAllpdf();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF List'),
      ),
      body: GridView.builder(
        itemCount: pdfData.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
        itemBuilder: (context, index) {

          return Padding(padding: const EdgeInsets.all(8.8),
          child:InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                border:Border.all(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                  pdfData[index]['name'],
                  style: TextStyle(
                  fontSize: 18
              ),
              ),

                ],
              ),
            ),
          )
          );
        },
      ),
    );
  }
}
class PdfViewerScreen  extends StatefulWidget {
  final String pdfUrl;

  const PdfViewerScreen  ({Key key, this.pdfUrl}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => PdfViewerScreenState();
}

class PdfViewerScreenState extends State<PdfViewerScreen> {

  PDFDocument document;
  void initialisePdf()async
  {
    document= await PDFDocument.fromURL(widget.pdfUrl);
    setState((){});

}



  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

// class PDFScreen extends StatelessWidget {
//   final String pdfUrl;
//
//   const PDFScreen({Key key, this.pdfUrl}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Document'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Open PDF'),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => PDFViewerScreen(pdfUrl: pdfUrl),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class PDFViewerScreen extends StatelessWidget {
//   final String pdfUrl;
//
//   const PDFViewerScreen({Key key,  this.pdfUrl}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('PDF Viewer'),
//       ),
//
//     );
//   }
// }
