
import 'package:flutter/material.dart';
import 'Water Drinking/Bottom Bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove the debug banner
      debugShowCheckedModeBanner: false,
      home: NavBar(),

    );
  }
}
