import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  TextEditingController _minController = TextEditingController();
  TextEditingController _secController = TextEditingController();
  int _minutes = 0;
  int _seconds = 0;
  bool _isActive = false;

  @override
  void dispose() {
    _minController.dispose();
    _secController.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _isActive = true;
      _minutes = int.tryParse(_minController.text) ?? 0;
      _seconds = int.tryParse(_secController.text) ?? 0;
      _minController.clear();
      _secController.clear();
    });

    Future<void> tick() async {
      if (_seconds == 0) {
        if (_minutes == 0) {
          setState(() {
            _isActive = false;
          });
          return;
        }
        _minutes--;
        _seconds = 59;
      } else {
        _seconds--;
      }
      setState(() {});
      await Future.delayed(Duration(seconds: 1));
      if (_isActive) {
        tick();
      }
    }

    tick();
  }

  void _stopTimer() {
    setState(() {
      _isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 123, 227, 126),
      appBar: AppBar(
        title: Text('Taymer ilovasi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Text(
                      'Min:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      child: TextField(
                        controller: _minController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Text(
                  ':',
                  style: TextStyle(fontSize: 50, color: Colors.red),
                ),
                Column(
                  children: [
                    Text(
                      'Sec:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue,
                          width: 2.0,
                        ),
                      ),
                      child: TextField(
                        controller: _secController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            _isActive
                ? Text(
                    '$_minutes:${_seconds.toString().padLeft(2, '0')}',
                    style: TextStyle(fontSize: 50),
                  )
                : Text(
                    '00:00',
                    style: TextStyle(fontSize: 50),
                  ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _isActive ? _stopTimer : _startTimer,
                  child: _isActive ? Text('Stop') : Text('Start'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
