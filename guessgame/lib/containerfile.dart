import 'package:flutter/material.dart';
class RepeatcontainerCode extends StatelessWidget {
  RepeatcontainerCode({@required this.colors,this.cardwidget,this.onpressed});
  final Color colors;
  final Widget cardwidget;
  final Function onpressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.all(15.0),
        child: cardwidget,
        decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadiusDirectional.circular(10.0)
        ),
      ),
    );
  }
}