import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'IconTextFile.dart';

const activeColor =Color(0xFF1D1E33);
const deActiveColor =Color(0xFF111328);
class inputpage extends StatefulWidget {
  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
  Color malecolor=deActiveColor;
  Color femalecolor= deActiveColor;
  void updateColor(int gender)
  {
  if(gender==1){
    Color malecolor=activeColor;
    Color femalecolor= deActiveColor;
  }
  if(gender==2){
    Color malecolor=activeColor;
    Color femalecolor= deActiveColor;
  }
  }
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
              Expanded(child:GestureDetector(
                onTap:   () {
                  setState(() {
                    updateColor(1);
                  });
                },
                child: RepeatContainerCode(
                  colors:malecolor,
                  cardwidget: repeatTextandIcon(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),

                ),
              ),),
              Expanded(child:GestureDetector(
                onTap:   () {
                  setState(() {
                    updateColor(2);
                  });
                },
                child: RepeatContainerCode(
                  colors:femalecolor,
                  cardwidget: repeatTextandIcon(
                    iconData: FontAwesomeIcons.female,
                    label: 'Female',
                  ),
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
