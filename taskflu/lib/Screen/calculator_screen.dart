import 'package:flutter/material.dart';
import 'package:taskflu/model/calculator_model.dart';
// import 'model.dart';

void main() {
  runApp(CalculatorScreen());
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorModel model = CalculatorModel();

  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  void calculateResult() {
    setState(() {
      model.firstNumber = double.parse(firstNumberController.text);
      model.secondNumber = double.parse(secondNumberController.text);
      model.calculateResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Calculator'),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
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
              Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Radio(
                        value: 'Add',
                        groupValue: model.operation,
                        onChanged: (value) {
                          setState(() {
                            model.operation = value.toString();
                          });
                        },
                      ),
                      title: Text('Add'),
                    ),
                    ListTile(
                      leading: Radio(
                        value: 'Subtract',
                        groupValue: model.operation,
                        onChanged: (value) {
                          setState(() {
                            model.operation = value.toString();
                          });
                        },
                      ),
                      title: Text('Subtract'),
                    ),
                    ListTile(
                      leading: Radio(
                        value: 'Multiply',
                        groupValue: model.operation,
                        onChanged: (value) {
                          setState(() {
                            model.operation = value.toString();
                          });
                        },
                      ),
                      title: Text('Multiply'),
                    ),
                    ListTile(
                      leading: Radio(
                        value: 'Divide',
                        groupValue: model.operation,
                        onChanged: (value) {
                          setState(() {
                            model.operation = value.toString();
                          });
                        },
                      ),
                      title: Text('Divide'),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: calculateResult,
                child: Text('Calculate'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Result: ${model.result}',
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
