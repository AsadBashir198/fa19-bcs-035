import 'CalculatorFile.dart';
import 'package:flutter/material.dart';
import 'constantFile.dart';
import 'containerfile.dart';
import 'input_page.dart';
import 'constantFile.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {@required this.interpretation,
        @required this.bmiResult,
        @required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('kids Result'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: RepeatcontainerCode(
              colors : Color(0xFF42A5F5),
              cardwidget : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText.toUpperCase(),
                    style: kResultText,
                  ),
                  Text(
                     bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                     interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => InputPage()));
            },
            child: Container(
              child: Center(
                child: Text(
                  'ReCalculate',
                  style: KLargeButtonsStyle,
                ),
              ),
              color: Color(0xFFEB1555),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
            ),
          ))

        ],
      ),
    );
  }
}
