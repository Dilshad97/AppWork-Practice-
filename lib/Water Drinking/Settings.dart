import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}
double _currentSliderValue = 20;
double _currenstSliderValue = 20;


late SharedPreferences data;

String? addeddata;




class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Container(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: _currentSliderValue,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
                SizedBox(height: 20,),
                Slider(
                  value: _currentSliderValue,
                  max: 100,
                  divisions: 5,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }



  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      addeddata=data.getString('newdata');

    });
  }



}



