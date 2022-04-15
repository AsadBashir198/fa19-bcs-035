import 'dart:math';

class CalculatorBrain{

  CalculatorBrain({required this.height,required this.weight});

  final int height;
  final int weight;
  double _bmi;
  String calculateBMI(){
    _bmi=weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){

    if(_bmi>=25){
      return 'Overweight';

    }
    else if (_bmi>18.5){
      return'Normal';
    }
    else{
      return'underweight';
    }
  }
  String getInterpretation(){
    if(_bmi>=25)
      {
        return'you have a higher than normal body weight.Try to exercise';
      }
    else if(_bmi>=18.5){
      return'you have a normal weight.good job';
    }
    else{
      'you have a lower than normal body weight.you can eat a bit';
    }
  }

}