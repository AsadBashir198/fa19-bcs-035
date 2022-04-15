import 'dart:html';
import 'constantFile.dart';
import 'package:bmi/constantFile.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';

 class ResultScreen extends StatelessWidget {
   const ResultScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         title: Text('BMI Result'),
       ),
       body: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         CrossAxisAlignment: CrossAxisAlignment.stretch,
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
                       Text('Normal',style: kResultText),
                       Text('18.3',style: kBMiTextStyle),
                       Text('BMI IS LOW you should have to work more',
                       textAlign: TextAlign.center,
                       style: kbodyTextStyle,
                       ),
                     ],
                   ),
               ),
           ),
           Expanded(
             child:     GestureDetector(
                 onTap: (){
                   Navigator.push(context,MaterialPageRoute(builder: (context)=>InputPage()));

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
