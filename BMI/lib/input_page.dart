
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
              ),),
              Expanded(child:RepeatContainerCode(
                colors:Color(0xFF1D1E33),
              ),),
            ],

          ),),

          Expanded(child:Row(
            children: [
              Expanded(child:RepeatContainerCode(
                colors:Colors.purpleAccent,
              ),),
            ],
          ),),

          Expanded(child:Row(children: [
            Expanded(child:RepeatContainerCode(
              colors:Color(0xFF1D1E33),
            ),),
            Expanded(child:RepeatContainerCode(
              colors:Color(0xFF1D1E33),
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
  RepeatContainerCode({required this.colors});
  Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color:colors,
        borderRadius: BorderRadius.circular(10.0)
      ),
    );
  }
}