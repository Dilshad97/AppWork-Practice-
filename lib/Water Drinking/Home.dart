import 'package:appwork/Water%20Drinking/Bottom%20Bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
    // check_if_already_login();
  }

  String addeddata ='';
  void initial() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      addeddata=data.getString('newdata')!;

    });
  }
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
                  "WaterManic App",
                )),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 100),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          // color: Colors.red,
                          shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("%"),
                          Text('${addeddata} ml',style: TextStyle(fontSize: 30),)
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text("Remainig"),
                          Text("${addeddata}"),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Target"),
                          Text("1000"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text("Tap"),
                  style: ElevatedButton.styleFrom(shape: CircleBorder()),
                ),
              ],
            ),
          ),
        ));
  }

  late SharedPreferences data;
  late bool newdata;


  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        String value = _controller.text;
        if(value!=''){
          data.setString('newdata', value);
        }
        Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar(),));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Target"),
      content:TextField(
        controller: _controller,
      ),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
