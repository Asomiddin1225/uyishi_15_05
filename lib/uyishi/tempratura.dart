import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController cController = TextEditingController();
  final TextEditingController fController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Celsius -> Fahrenheit       Fahrenheit -> Celsius',
            selectionColor: Colors.yellow,
          ),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: cController,
                    decoration: InputDecoration(
                      labelText: 'Celsius',
                    ),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        double celsius = double.parse(text);
                        double fahrenheit = (celsius * 9 / 5) + 32;
                        fController.text = fahrenheit.toStringAsFixed(2);
                      } else {
                        fController.text = '';
                      }
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  child: TextField(
                    controller: fController,
                    decoration: InputDecoration(
                      labelText: 'Fahrenheit',
                    ),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        double fahrenheit = double.parse(text);
                        double celsius = (fahrenheit - 32) * 5 / 9;
                        cController.text = celsius.toStringAsFixed(2);
                      } else {
                        cController.text = '';
                      }
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
