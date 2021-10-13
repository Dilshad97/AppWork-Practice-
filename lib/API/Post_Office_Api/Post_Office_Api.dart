
import 'package:appwork/API/Post_Office_Api/Screen2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post_Office_Api extends StatefulWidget {
  Post_Office_Api({Key? key}) : super(key: key);

  @override
  _Post_Office_ApiState createState() => _Post_Office_ApiState();
}

class _Post_Office_ApiState extends State<Post_Office_Api> {
  final ctrl = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  ScrollController _controller1 = ScrollController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.all(20),
                  // color: Colors.deepPurple,
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    controller: ctrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.red,width: 5)
                        ),
                        labelText: 'Enter Pincode',
                        hintText: 'Enter Your Pincode'
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 500,


                  child: ListView.builder(
                    itemCount: notificationList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: (){
                            setState(() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Screen2(notificationList[index]['Name'])));
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: 100,
                              color: Colors.green,
                              child: Text('submit')));
                    },
                  ),
                ),
                SizedBox(height: 20 ,)

              ],
            ),
          )
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  List<dynamic> notificationList = [];


  onNotificationLoad() async {

    {

      var response =
      await http.get(Uri.parse('http://www.postalpincode.in/api/pincode/'+ctrl.text),
          headers: {
            'Accept': 'application/json',
          }
      );
      print(response);
      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body) as Map;
        print(decode.toString());
        if (decode['Status'] == 'Success') {
          print(decode.toString());
          print("Get Data:" + decode['PostOffice'].toString());
          notificationList.clear();
          for (int i = 0; i < decode['PostOffice'].length; i++) {
            setState(() {
              notificationList.add(decode['PostOffice'][i]);
              print('list length is --------->${decode['PostOffice'][i]}');
            });
          }

        } else {
          print(decode.toString());


        }

        return;
      }
    }
  }

}