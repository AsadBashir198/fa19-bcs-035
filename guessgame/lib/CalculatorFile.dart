import 'dart:math';
class CalculatorBrain{
  CalculatorBrain({this.max,this.min,this.bmi});
  final int max;
  final int min;
  int bmi;

  String calculateBMI() {
    return bmi.toString();

  }

  String getResult() {
    if (bmi >= min&&bmi<=max ) {
      return 'Perfect';
    } else if (bmi >max ) {
      return 'You are Too High';
    } else {
      return 'You are Too Low';
    }
  }

  String getInterpretation() {
    if (bmi >= 25) {
      return 'Perfect';
    } else if (bmi >= 18.5) {
      return 'You are Too High';
    } else {
      return 'You are Too Low';
    }
  }
}

