import 'package:flutter/material.dart';

class radio extends StatefulWidget {
  const radio({Key? key}) : super(key: key);

  @override
  _radioState createState() => _radioState();
}

class _radioState extends State<radio> {



  String? _radioValue; //Initial definition of radio button value
  String? choice;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        case 'three':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: <Widget>[
            Radio(
              value: 'one',
              groupValue: _radioValue,
             onChanged: (value) {
               radioButtonChanges;
             },
            ),
            Text(
              "One selected",
            ),
          ],
        ),
      ),
    );
  }
}
