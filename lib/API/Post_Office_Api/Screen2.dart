import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
 String Name;
   Screen2( this.Name);

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  ScrollController _controller1 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
          child: Text(widget.Name)
          ),
        ],
      ),
    );
  }
}
