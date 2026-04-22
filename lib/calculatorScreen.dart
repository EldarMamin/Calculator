import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  CalculatorScreenState createState() => CalculatorScreenState();
}

class CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  double result = 0;

  double get firstValue => double.tryParse(firstController.text) ?? 0;
  double get secondValue => double.tryParse(secondController.text) ?? 0;

  void resetCalculator() {
    setState(() {
      firstController.clear();
      secondController.clear();
      result = 0;
    });
  }

  @override
  Widget build(Object context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(title: Text('Mini-calculator'), centerTitle: true, backgroundColor: Colors.amber),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: firstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите первое число',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 24),

            TextField(
              controller: secondController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Введите второе число',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue + secondValue;
                    });
                  },
                  child: Text('+', style: TextStyle(fontSize: 16)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue - secondValue;
                    });
                  },
                  child: Text('-', style: TextStyle(fontSize: 16)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = firstValue * secondValue;
                    });
                  },
                  child: Text('*', style: TextStyle(fontSize: 16)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (secondValue == 0) {
                        result = 0;
                      } else {
                        result = firstValue / secondValue;
                      }
                    });
                  },
                  child: Text('÷', style: TextStyle(fontSize: 16)),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                  ),
                  onPressed: () {
                    setState(() {
                      resetCalculator();
                    });
                  },
                  child: Text('reset', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),

            SizedBox(height: 30),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Результат: $result',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
