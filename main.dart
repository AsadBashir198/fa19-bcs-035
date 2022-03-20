import 'package:flutter/material.dart';
import 'dart:math';
int num = 1;
int num2 = 2;
int num3 = 3;
int num4 = 4;
int sum=0;
int sum2=0;
int sum3=0;
int sum4=0;
int max=0;
String vari='max';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: Text("1st Dice:$sum   2nd Dice:$sum2   3rd Dice:$sum3   4th Dice:$sum4"),
      ),
      body: mydiceapp1(),
    ),
  ));
}


class mydiceapp1 extends StatefulWidget {
  @override
  _mydiceapp1State createState() => _mydiceapp1State();
}
class _mydiceapp1State extends State<mydiceapp1> {
  @override
  Widget build(BuildContext context) {

    return Center (
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [

                Expanded(
                    child: TextButton(
                      child: Image.asset("images/dice$num.png"),
                      onPressed: () {
                        setState(() {
                          num = Random().nextInt(6) + 1;
                          sum=sum+num;
                          if(sum>sum2 && sum>sum3 && sum>sum4)
                          {max=sum;
                          vari='1st Dice';}
                          runApp(MaterialApp(
                            home: Scaffold(
                              backgroundColor: Colors.amberAccent,
                              appBar: AppBar(
                                title: Text("1st Dice:$sum   2nd Dice:$sum2   3rd Dice:$sum3   4th Dice:$sum4"),
                              ),
                              body: mydiceapp1(),
                            ),
                          ));
                        });
                        print(num);
                      },
                    )),
                Expanded(
                    child: TextButton(
                      child: Image.asset("images/dice$num2.png"),
                      onPressed: () {
                        setState(() {
                          num2 = Random().nextInt(6) + 1;
                          sum2=sum2+num2;
                          if(sum2>sum && sum2>sum3 && sum>sum4)
                          {max=sum2;
                          vari='2nd Dice';}
                          runApp(MaterialApp(
                            home: Scaffold(
                              backgroundColor: Colors.amberAccent,
                              appBar: AppBar(
                                title: Text("1st Dice:$sum   2nd Dice:$sum2   3rd Dice:$sum3   4th Dice:$sum4"),
                              ),
                              body: mydiceapp1(),
                            ),
                          ));
                        });
                        print(num2);
                      },
                    )),



              ],

            ),

          ),
          SizedBox(height: 100),
          Expanded(
            child: Row(
              children: [


                Expanded(
                    child: TextButton(
                      child: Image.asset("images/dice$num3.png"),
                      onPressed: () {
                        setState(() {
                          num3 = Random().nextInt(6) + 1;
                          sum3=sum3+num3;
                          if(sum3>sum2 && sum3>sum && sum3>sum4)
                          {max=sum3;
                          vari='3rd Dice';}
                          runApp(MaterialApp(
                            home: Scaffold(
                              backgroundColor: Colors.amberAccent,
                              appBar: AppBar(
                                title: Text("1st Dice:$sum   2nd Dice:$sum2   3rd Dice:$sum3   4th Dice:$sum4"),
                              ),
                              body: mydiceapp1(),
                            ),
                          ));
                        });
                        print(num3);
                      },
                    )),
                Expanded(
                    child: TextButton(
                      child: Image.asset("images/dice$num4.png"),
                      onPressed: () {
                        setState(() {
                          num4 = Random().nextInt(6) + 1;
                          sum4=sum4+num4;
                          if(sum4>sum2 && sum4>sum3 && sum4>sum)
                          {max=sum4;
                          vari='4th Dice';}
                          runApp(MaterialApp(
                            home: Scaffold(
                              backgroundColor: Colors.amberAccent,
                              appBar: AppBar(
                                title: Text("1st Dice:$sum   2nd Dice:$sum2   3rd Dice:$sum3   4th Dice:$sum4 " ),
                              ),
                              body: mydiceapp1(),
                            ),
                          ));
                        });
                        print(num4);

                      },
                    )),
              ],
            ),
          ),

          Expanded(
            child: Row(
              children: [


                Expanded(child:   FloatingActionButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Winner Announcement',
                      ),
                      content:  Text(
                        'Winner:$vari    Score:$max',
                      ),
                      actions: <Widget>[

                        TextButton(
                          onPressed: () => Navigator.pop(
                            context,
                            'Cancel',
                          ),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(
                            context,
                            'OK',
                          ),
                          child: const Text(
                            'OK',
                          ),
                        ),
                      ],
                    ),
                  ),
                  child: const Text(
                    'RESULT',
                  ),
                ),),

              ],

            ),

          ),


        ],
      ),
    );
  }
}

/*

 */
