import 'package:flutter/material.dart';
import 'input_page.dart';
void main() {
  runApp(const bmical());
}

class bmical extends StatelessWidget {
  const bmical({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(
      ),
      home: inputpage()
    );
  }
}

