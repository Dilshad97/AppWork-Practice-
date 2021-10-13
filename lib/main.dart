import 'package:appwork/API/Post_Office_Api/Post_Office_Api.dart';
import 'package:appwork/API/Practice_Api2/Api_No_3.dart';
import 'package:appwork/API/Practice_Api2/Api_No_4.dart';
import 'package:appwork/Flutter_Toast/Toast.dart';
import 'package:flutter/material.dart';

import 'API/Practice_Api2/Api_No_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Post_Office_Api(),

    );
  }
}
