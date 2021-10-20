
import 'package:flutter/material.dart';

import 'API/News_Api/News1.dart';
import 'Inherited Widget/Inherited Widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: InheritedWidgetExample(),

    );
  }
}
