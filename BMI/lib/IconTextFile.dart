
import 'package:flutter/material.dart';

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