import 'package:bmi/constantFile.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'IconTextFile.dart';
import 'constantFile.dart';
import 'resultFile.dart';


enum Gender{
  male,
  female,
}

class inputpage extends StatefulWidget {
  @override
  State<inputpage> createState() => _inputpageState();
}

class _inputpageState extends State<inputpage> {
   Gender? selectGender;
   int sliderHeight=180;
   int sliderWeight=60;
   int sliderAge=20;

  /* Color malecolor=deActiveColor;
  Color femalecolor= deActiveColor;
  void updateColor(Gender gendertype)
  {
  if(gendertype==Gender.male){
    Color malecolor=activeColor;
    Color femalecolor= deActiveColor;
  }
  if(gendertype==Gender.female){
    Color malecolor=activeColor;
    Color femalecolor= deActiveColor;
  }
  }*/
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text("BMI CALCULATOR"),
      ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child:Row(
            children: [
              Expanded(
                child: RepeatContainerCode(
                        onPressed:(){
                          setState(() {
                            selectGender=Gender.male;
                          });
                        },
                  colors:selectGender==Gender.male?activeColor:deActiveColor,
                  cardwidget: repeatTextandIcon(
                    iconData: FontAwesomeIcons.male,
                    label: 'Male',
                  ),

                ),
              ),
              Expanded(
                child: RepeatContainerCode(
                  onPressed:(){
                    setState(() {
                      selectGender=Gender.female;
                    });
                  },
                  colors:selectGender==Gender.female?activeColor:deActiveColor,
                  cardwidget: repeatTextandIcon(
                    iconData: FontAwesomeIcons.female,
                    label: 'Female',
                  ),
                ),
              ),
            ],

          ),),
          Expanded(child:Row(
            children: [
              Expanded(child:RepeatContainerCode(
                onPressed:(){
                  setState(() {
                    selectGender=Gender.male;
                  });
                },
               colors:Color(0xFF1D1E33),
                cardwidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',style: kLabelStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sliderHeight.toString(),
                          style:kNumberStyle,
                        ),
                        Text(
                          'cm',
                          style:kLabelStyle,
                        ),
                      ],
                      ),
                      Slider(
                      value: sliderHeight.toDouble();
    min:120.0;
    max:220.0;
    activeColor =Color(0xFF1D1E33);
    inactiveColor =Color(0xFF8D8E98),
    onChanged: (double newValue)
    {
    SetState((){
    sliderHeight=newValue.round();
    }
    );
    },
    ),
                  ],
                ),
              ),),
            ],
          ),
          ),
          Expanded(child:Row(children: [
            Expanded(child:RepeatContainerCode(
              colors:Color(0xFF1D1E33),
              cardwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'WEIGHT',
                    style: kLabelStyle,
                  ),
                   Text(
                       sliderWeight.toString(),
                     style: kNumberStyle,
                   ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIcon(
                        iconData: FontAwesomeIcons.minus ,
                         onPress: (){
                          setState(() {
                            sliderWeight--;
                          });
                         }
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIcon(
                          iconData: FontAwesomeIcons.minus ,
                          onPress: (){
                            setState(() {
                              sliderWeight++;
                            });
                          }
                      ),
                    ],
                  )
                ],
              ), onPressed: () {  },
            ),),
            Expanded(child:RepeatContainerCode(
              onPressed:(){
                setState(() {
                  selectGender=Gender.male;
                });
              },
              colors:Color(0xFF1D1E33),
              cardwidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'AGE',
                    style: kLabelStyle,
                  ),
                  Text(
                    sliderAge.toString(),
                    style: kNumberStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundIcon(
                          iconData: FontAwesomeIcons.minus ,
                          onPress: (){
                            setState(() {
                              sliderAge--;
                            });
                          }
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      RoundIcon(
                          iconData: FontAwesomeIcons.minus ,
                          onPress: (){
                            setState(() {
                              sliderAge++;
                            });
                          }
                      ),
                    ],
                  )
                ],
              ),
            ),),
          ],

          ),),
         GestureDetector(
    onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=>ResultScreen()));

    },
   child:Container(
    child: Center(
    child: Text(
    'Calculate ',
    style: kLargeButtonstyle,
    ),
    ),
    color: Color(0xFFEB1555),
    margin: EdgeInsets.only(top: 10.0),
    width: double.infinity,
    height: 80.0,
    )
    )
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RepeatContainerCode extends StatelessWidget {
  RepeatContainerCode({required this.colors,required this.cardwidget,required this.onPressed});
  final Color colors;
  final  Widget cardwidget;
  final  VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardwidget,
        decoration: BoxDecoration(
            color:colors,
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
    );
  }
}

class RoundIcon extends StatelessWidget {
  RoundIcon({required this.iconData,required this.onPress});
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

