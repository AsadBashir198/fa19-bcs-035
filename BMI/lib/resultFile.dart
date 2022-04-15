import 'dart:html';
import 'package:bmi/main.dart';

import 'constantFile.dart';
import 'package:bmi/constantFile.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

 class ResultScreen extends StatelessWidget {
   ResultScreen({
     required this.interpretation,
     required this.bmiResult,
     required this.resultText
   });


  final String bmiResult;
  final String resultText;
  final String interpretation;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('BMI Result'),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [

           Expanded(
             child: Container(
               child: Center(
                 child: Text(
                   'Your Result',
                   style: kTitleStyleS2,
                 ),
               ),
             ),
           ),
           Expanded(
             flex: 5,
               child: RepeatContainerCode(
                 colors: activeColor,
                   cardwidget: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text(resultText.toUpperCase(),style: kResultText),
                       Text(bmiResult,style: kBMiTextStyle),
                       Text(interpretation,
                       textAlign: TextAlign.center,
                       style: kbodyTextStyle,
                       ),
                     ],
                   ), onPressed: () {  },
               ),
           ),
           Expanded(
             child:     GestureDetector(
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>inputpage()));

                 },
                 child:Container(
                   child: Center(
                     child: Text(
                       'ReCalculate ',
                       style: kLargeButtonstyle,
                     ),
                   ),
                   color: Color(0xFFEB1555),
                   margin: EdgeInsets.only(top: 10.0),
                   width: double.infinity,
                   height: 80.0,
                 )
             ),
           ),
         ],
       ),
     );
   }
 }
