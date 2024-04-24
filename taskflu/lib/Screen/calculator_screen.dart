import 'package:flutter/material.dart';

void main() {
  runApp(ArithmeticCalculator());
}

class ArithmeticCalculator extends StatefulWidget {
  @override
  _ArithmeticCalculatorState createState() => _ArithmeticCalculatorState();
}

class _ArithmeticCalculatorState extends State<ArithmeticCalculator> {
  double firstNumber = 0.0;
  double secondNumber = 0.0;
  double result = 0.0;
  String operation = '';

  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  void calculateResult() {
    setState(() {
      firstNumber = double.parse(firstNumberController.text);
      secondNumber = double.parse(secondNumberController.text);

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Arithmetic'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: firstNumberController,
                decoration: InputDecoration(
                  labelText: 'First number',
                ),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: secondNumberController,
                decoration: InputDecoration(
                  labelText: 'Second number',
                ),
                keyboardType: TextInputType.number,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'Add';
                      });
                      calculateResult();
                    },
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'Subtract';
                      });
                      calculateResult();
                    },
                    child: Text('Subtract'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'Multiply';
                      });
                      calculateResult();
                    },
                    child: Text('Multiply'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        operation = 'Divide';
                      });
                      calculateResult();
                    },
                    child: Text('Divide'),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Result: $result',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}