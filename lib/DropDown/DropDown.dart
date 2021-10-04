import 'package:flutter/material.dart';

class DropDownDemo extends StatefulWidget {
  @override
  _DropDownDemoState createState() => _DropDownDemoState();
}

class _DropDownDemoState extends State<DropDownDemo> {
  String? dropdownValue;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown'),
      ),
      body: Center(
        child: DropdownButtonFormField(
          value: dropdownValue,
          hint: Text('Select a color'),
          icon: const Icon(Icons.arrow_drop_down),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },

          items: <String>['Red', 'Green', 'Blue']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),

            );
          }

          ).toList(),

        ),
      ),
    );
  }
}



