import 'package:flutter/material.dart';
import 'package:move_task_to_back/move_task_to_back.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MoveTaskToBackTest',
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('go to second screen'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SecondScreen();
            }));
          },
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SecondScreen"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Tap to MoveTaskToBack"),
          onPressed: test,
        ),
      ),
    );
  }

  Future<void> test() async {
    try {
      await MoveTaskToBack.moveTaskToBack(nonRoot: false);
    } on Exception {
      print("something wrong...");
    }
  }
}
