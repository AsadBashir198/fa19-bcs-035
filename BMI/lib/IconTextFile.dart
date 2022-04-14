
import 'package:bmi/constantFile.dart';
import 'package:flutter/material.dart';
import 'constantFile.dart';

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
          style:kLabelStyle,
        )
      ],
    );
  }
}