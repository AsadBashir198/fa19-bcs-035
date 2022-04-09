
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
              Expanded(child:Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color:Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)
                ),
              ),),
              Expanded(child:Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color:Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),),
            ],

          ),),

          Expanded(child:Row(
            children: [
              Expanded(child:Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    color:Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10.0)
                ),
              ),),
            ],
          ),),

          Expanded(child:Row(children: [
            Expanded(child:Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color:Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)
              ),
            ),),
            Expanded(child:Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                  color:Color(0xFF1D1E33),
                  borderRadius: BorderRadius.circular(10.0)
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