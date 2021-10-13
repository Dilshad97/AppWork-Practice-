import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onNotificationLoad();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:Scaffold(
      body: Center(
      child: ListView.builder(
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                // bottomRight: Radius.circular(3),
                topRight: Radius.circular(50),
                  bottomLeft:  Radius.circular(45),
                  // topLeft: Radius.circular(10),
              ),
                  side: BorderSide(color:Colors.red)
            ),
            // shape: Border(right: BorderSide(color: Colors.red,width: 8)),
            elevation: 5,
            color: Colors.blueGrey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Name  :' ),
                    Text(notificationList[index]['name']),
                  ],
                ),
                Row(
                  children: [
                    Text('Email  :' ),
                    Text(notificationList[index]['email']),
                  ],
                ),
                Row(
                  children: [
                    Text('Postid  :' ),
                    Text('${notificationList[index]['postId']}'),
                  ],
                ),
                Row(
                  children: [
                    Text('Id  :' ),
                    Text('${notificationList[index]['id']}'),
                  ],
                ),
                Row(
                  children: [
                    Text('Body  :' ),
                    Expanded(child: Text('${notificationList[index]['body']}')),
                  ],
                ),
              ],
            ),
          );

      },),
      ),
    ));
  }


  List<dynamic> notificationList = [];


  onNotificationLoad() async {
    {

      var response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'),

      );
      log(response.body.toString());
      if (response.statusCode == 200) {
          var decode = jsonDecode(response.body) ;
          log(decode.toString());

          /* 1. checking loop for the list in json
         2. search data is Model name in json file*/

          for (int i = 0; i < decode[i].length; i++) {
            setState(() {
              notificationList.add(decode[i]);

            });
            /* 1.checking responce on terminal for search_data => kirtan_data =>crator_name
            2.creator name is object of class Kirtan in json file*/

            log('notificationLis ${decode[i]}');
          }

        return;
      }
    }
  }

}
