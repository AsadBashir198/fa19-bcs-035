import 'dart:html';

import 'package:flutter/material.dart';
 class ResultScreen extends StatelessWidget {
   const ResultScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('BMI Result'),
       ),
       body: Text(
         'Body Data'
       ),
     );
   }
 }
