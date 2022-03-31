import 'dart:async';
import "package:flutter/material.dart";
import 'package:audioplayers/audioplayers.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    ),
  );
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                ColorPickerclass()

            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      color: Colors.white,
      child:Image.asset('images/img.png'),

    );
  }
}



class ColorPickerclass extends StatefulWidget {
  @override
  State<ColorPickerclass> createState() => _ColorPickerclassState();
}

class _ColorPickerclassState extends State<ColorPickerclass> {
  Color n1 = Colors.red;
  Color n2 = Colors.blue;
  Color n3 = Colors.lime;
  Color n4 = Colors.brown;
  Color n5 = Colors.lightGreen;
  Color n6 = Colors.deepPurple;
  Color n7 = Colors.tealAccent;
  void changeColor1(Color color) {
    setState(() {
      n1=color;


    });
  }
  void changeColor2(Color color) {
    setState(() {
      n2=color;
    });
  }
  void changeColor3(Color color) {
    setState(() {
      n3=color;
    });
  }
  void changeColor4(Color color) {
    setState(() {
      n4=color;
    });
  }
  void changeColor5(Color color) {
    setState(() {
      n5=color;
    });
  }
  void changeColor6(Color color) {
    setState(() {
      n6=color;
    });
  }
  void changeColor7(Color color) {
    setState(() {
      n7=color;
    });
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(

                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n1,
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            onColorChanged: changeColor1,
                            pickerColor: n1,

                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Change Color")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Xylo(colors1:n1,colors2: n2,colors3: n3,colors4: n4,colors5: n5,colors6: n6,colors7: n7,)));
              }, child: Text("Next"))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n2,
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            onColorChanged: changeColor2,
                            pickerColor: n2,

                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Change Color")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Xylo(colors1:n1,colors2: n2,colors3: n3,colors4: n4,colors5: n5,colors6: n6,colors7: n7,)));
              }, child: Text("Next"))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n3,
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            onColorChanged: changeColor3,
                            pickerColor: n3,

                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Change Color")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Xylo(colors1:n1,colors2: n2,colors3: n3,colors4: n4,colors5: n5,colors6: n6,colors7: n7,)));
              }, child: Text("Next"))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n4,
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            onColorChanged: changeColor4,
                            pickerColor: n4,

                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Change Color")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Xylo(colors1:n1,colors2: n2,colors3: n3,colors4: n4,colors5: n5,colors6: n6,colors7: n7,)));
              }, child: Text("Next"))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n5,
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            onColorChanged: changeColor5,
                            pickerColor: n5,

                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Change Color")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Xylo(colors1:n1,colors2: n2,colors3: n3,colors4: n4,colors5: n5,colors6: n6,colors7: n7,)));
              }, child: Text("Next"))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n6,
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            onColorChanged: changeColor7,
                            pickerColor: n6,

                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Change Color")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Xylo(colors1:n1,colors2: n2,colors3: n3,colors4: n4,colors5: n5,colors6: n6,colors7: n7,)));
              }, child: Text("Next"))
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: n7,
                ),
              ),

              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            onColorChanged: changeColor7,
                            pickerColor: n7,

                          ),
                        ),
                      ),
                    );
                  },
                  child: Text("Change Color")),
              ElevatedButton(onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Xylo(colors1:n1,colors2: n2,colors3: n3,colors4: n4,colors5: n5,colors6: n6,colors7: n7,)));
              }, child: Text("Next"))
            ],
          ),
        ],
      ),
    );
  }
}

class Xylo extends StatelessWidget {
  Xylo({this.colors1,this.colors2,this.colors3,this.colors4,this.colors5,this.colors6,this.colors7});
  final Color colors1;
  final Color colors2;
  final Color colors3;
  final Color colors4;
  final Color colors5;
  final Color colors6;
  final Color colors7;


  void playsound(int value) {
    final player = AudioCache();
    player.play('note$value.wav');
  }

  Expanded button(int num, Color color) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          playsound(num);
        },
        child: null,
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("Xylophone"),
        leading: Icon(
          Icons.circle,
        ),

      ),
      body: Container(
        color: Colors.black,
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            button(1, colors1),
            SizedBox(
              height: 10.0,
            ),
            button(2, colors2),
            SizedBox(
              height: 10.0,
            ),
            button(3, colors3),
            SizedBox(
              height: 10.0,
            ),
            button(4, colors4),
            SizedBox(
              height: 10.0,
            ),
            button(5, colors5),
            SizedBox(
              height: 10.0,
            ),
            button(6, colors6),
            SizedBox(
              height: 10.0,
            ),
            button(7, colors7),
          ],
        ),
      ),
    );
  }
}
