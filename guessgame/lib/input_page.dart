import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icontextfile.dart';
import 'containerfile.dart';
import 'constantFile.dart';
import 'ResultFile.dart';
import 'CalculatorFile.dart';

int minnum=1;
int maxnum=100;
Random random = new Random();
int newvar=random.nextInt(100);


enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectGender;
  int sliderHeight=100;
  int sliderWeight=20;
  int sliderAge=15;

//  Color maleColor = deActiveColor;
  //Color feMaleColor = deActiveColor;
  //void updateColor(Gender gendertype)
  //{
    //if(gendertype==Gender.male){
      //maleColor = activeColor;
      //feMaleColor = deActiveColor;
    //}
    //if(gendertype==Gender.female){

      //feMaleColor = activeColor;
      //maleColor = deActiveColor;
    //}
  //}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GUESSING GAME APP FOR KIDS'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: RepeatcontainerCode(
                  onpressed: (){
                    setState(() {
                      selectGender=Gender.male;
                    });
                  },
                    colors: selectGender==Gender.male?activeColor:deActiveColor,
                    cardwidget: RepeatIconandTextwidget(
                      iconData: FontAwesomeIcons.faceSmile,
                      label: 'EASY',
                    ),
                ),

              ),
              Expanded(
                child: RepeatcontainerCode(
                  onpressed: (){
                    setState(() {
                      selectGender=Gender.female;
                    });
                  },
                  colors: selectGender==Gender.female?activeColor:deActiveColor,

                  cardwidget: RepeatIconandTextwidget(
                    iconData: FontAwesomeIcons.bahtSign,
                    label: 'TOUGH',
                  ),
                ),

              ),
            ],
          ),),
          Expanded(child: RepeatcontainerCode(
            colors: Color(0xFF1D1E33),

            cardwidget:selectGender== Gender.female?null:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Range',style: kLabelStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$newvar',
                      style: kNumberStyle,
                    ),

                  ],
                ),
                Slider(
                  value:  newvar.toDouble(),
                  min: 1.0,
                  max: 100.0,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double newValue){
                    setState(() {


                    });
                  },
                ),

              ],
            ),
          ),),
          Expanded(child: Row(
          children: <Widget>[
          Expanded(child: RepeatcontainerCode(
            colors: Color(0xFF1D1E33),
            cardwidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'MAX',
                  style: kLabelStyle,

                ),
                Text(
                  sliderWeight.toString(),
                  style: kNumberStyle,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundIcon(
                      iconData: FontAwesomeIcons.minus,
                      onPress: (){
                        setState(() {
                          sliderWeight--;
                        });
                      },
                    ),
                    SizedBox(width: 10.0,),
                    RoundIcon(
                      iconData: FontAwesomeIcons.plus,
                      onPress: (){
                        setState(() {
                          sliderWeight++;
                        });
                      },

                    ),

                  ],
                ),

              ],
            ),
          ),),
          Expanded(child: RepeatcontainerCode(
            colors: Color(0xFF1D1E33),
            cardwidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'MIN',
                  style: kLabelStyle,

                ),
                Text(
                  sliderAge.toString(),
                  style: kNumberStyle,

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundIcon(
                      iconData: FontAwesomeIcons.minus,
                      onPress: (){
                        setState(() {
                          sliderAge--;
                        });
                      },
                    ),
                    SizedBox(width: 10.0,),
                    RoundIcon(
                      iconData: FontAwesomeIcons.plus,
                      onPress: (){
                        setState(() {
                          sliderAge++;
                        });
                      },

                    ),

                  ],
                ),

              ],
            ),
          ),),

        ],
      ),),
          GestureDetector(
            onTap: (){
              CalculatorBrain calc=CalculatorBrain(max: maxnum,min: minnum,bmi: newvar);
              Navigator.push(context, MaterialPageRoute(builder:  (context)=>ResultScreen(
                bmiResult: calc.calculateBMI(),
                resultText: calc.getResult(),
                interpretation: calc.getInterpretation(),
              )));
            },
            child: Container(
              child: Center(child: Text('Calculate',style: KLargeButtonsStyle,)),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ),
        ],
      ),
    );
  }
}
class RoundIcon extends StatelessWidget {
 RoundIcon({@required this.iconData,@required this.onPress});
  final IconData iconData;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconData),
      onPressed: onPress,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,

      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




