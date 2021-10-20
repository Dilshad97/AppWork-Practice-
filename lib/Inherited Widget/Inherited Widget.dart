import 'dart:math';

import 'package:appwork/Inherited%20Widget/Current_Score.dart';
import 'package:appwork/Inherited%20Widget/Info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InheritedWidgetExample extends StatefulWidget {
  @override
  _InheritedWidgetExampleState createState() => _InheritedWidgetExampleState();
}

class _InheritedWidgetExampleState extends State<InheritedWidgetExample> {
  final Random _random = Random();
  int _score = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Info(
              score: _score,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.score),
                  CurrentScore(),
                ],
              ),
            ),
            OutlinedButton(
              child: const Text('Change'),
              onPressed: () {
                setState(() {
                  _score = _random.nextInt(100);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
