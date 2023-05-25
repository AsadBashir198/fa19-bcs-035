import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
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

class _filepickerclState extends State<filepickercl>
    with SingleTickerProviderStateMixin {

   AnimationController loadingController;
  File _file;
  PlatformFile _platformFile;

  selectFile() async {
    final file = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['png', 'jpg', 'jpeg',]
    );

    if (file != null) {
      setState(() {
        _file = File(file.files.single.path);
        _platformFile = file.files.first;
      });
    }

    loadingController.forward();
  }


  @override
  void initState() {
    loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..addListener(() { setState(() {}); });

    super.initState();
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
                'File should be jpg, png',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: selectFile,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    child: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      color: Colors.blue.shade400,
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Iconsax.folder_open, color: Colors.blue, size: 40,),
                            const SizedBox(height: 15,),
                            Text('Select your file', style: TextStyle(fontSize: 15, color: Colors.grey.shade400),),
                          ],
                        ),
                      ),
                    )
                ),
              ),
              _platformFile != null
                  ? Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selected File',
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 15, ),),
                      const SizedBox(height: 10,),
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  offset: const Offset(0, 1),
                                  blurRadius: 3,
                                  spreadRadius: 2,
                                )
                              ]
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(_file, width: 70,)
                              ),
                              const SizedBox(width: 10,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(_platformFile.name,
                                      style: const TextStyle(fontSize: 13, color: Colors.black),),
                                    const SizedBox(height: 5,),
                                    Text('${(_platformFile.size / 1024).ceil()} KB',
                                      style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                                    ),
                                    const SizedBox(height: 5,),
                                    Container(
                                        height: 5,
                                        clipBehavior: Clip.hardEdge,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.blue.shade50,
                                        ),
                                        child: LinearProgressIndicator(
                                          value: loadingController.value,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10,),
                            ],
                          )
                      ),
                      const SizedBox(height: 20,),
                      // MaterialButton(
                      //   minWidth: double.infinity,
                      //   height: 45,
                      //   onPressed: () {},
                      //   color: Colors.black,
                      //   child: Text('Upload', style: TextStyle(color: Colors.white),),
                      // )
                    ],
                  ))
                  : Container(),
              const SizedBox(height: 150,),
            ],
          ),
        ));
  }
}
