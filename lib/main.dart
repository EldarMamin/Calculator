import 'package:flutter/material.dart';
import 'package:lesson3/calculatorScreen.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget{  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen()
    );
  }
}




