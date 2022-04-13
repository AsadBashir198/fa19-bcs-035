import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class inputpage extends StatefulWidget {
  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("BMI CALCULATOR"),
      ),
    body: Column(
        children: [
          Expanded(child:Row(
            children: [
              Expanded(child:RepeatContainerCode(
                colors:Color(0xFF1D1E33),
                cardwidget: repeatTextandIcon(
                  iconData: FontAwesomeIcons.male,
                  label: 'Male',
                ),

              ),),
              Expanded(child:RepeatContainerCode(
                colors:Color(0xFF1D1E33),
                cardwidget: repeatTextandIcon(
                  iconData: FontAwesomeIcons.female,
                  label: 'Female',
                ),
              ),),
            ],

          ),),

          Expanded(child:Row(
            children: [
              Expanded(child:RepeatContainerCode(
               colors:Color(0xFF1D1E33),
                cardwidget: repeatTextandIcon(
                  iconData: FontAwesomeIcons.female,
                  label: 'Female',
                ),
              ),),
            ],
          ),),

          Expanded(child:Row(children: [
            Expanded(child:RepeatContainerCode(
              colors:Color(0xFF1D1E33),
              cardwidget: repeatTextandIcon(
                iconData: FontAwesomeIcons.male,
                label: 'Male',
              ),
            ),),
            Expanded(child:RepeatContainerCode(
              colors:Color(0xFF1D1E33),
              cardwidget: repeatTextandIcon(
                iconData: FontAwesomeIcons.male,
                label: 'Male',
              ),
            ),),
          ],

          ),),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class repeatTextandIcon extends StatelessWidget {
  repeatTextandIcon({required this.iconData,required this.label});
 final  IconData iconData;
 final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData ,
          size: 80.0,

        ),
         SizedBox(
           height: 20.0,
           width: 21.0,
         ),
        Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}

class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({required this.colors,required this.cardwidget});
  final Color colors;
  final  Widget cardwidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: cardwidget,
      decoration: BoxDecoration(
        color:colors,
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}