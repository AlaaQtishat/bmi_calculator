import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight.';
    } else if (_bmi > 18.5 && _bmi < 25) {
      return 'You have a normal body weight.';
    } else {
      return 'You have a lower than normal body weight.';
    }
  }
}
