class CalculatorModel {
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  double result = 0.0;
  String operation = 'Add';

  void calculateResult() {
    switch (operation) {
      case 'Add':
        result = firstNumber + secondNumber;
        break;
      case 'Subtract':
        result = firstNumber - secondNumber;
        break;
      case 'Multiply':
        result = firstNumber * secondNumber;
        break;
      case 'Divide':
        result = firstNumber / secondNumber;
        break;
    }
  }
}