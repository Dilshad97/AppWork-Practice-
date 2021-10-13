import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
              return Card(
                color: Colors.green,
                elevation: 5,
                borderOnForeground: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    topRight:  Radius.circular(100),
                ),
                      side:BorderSide(color: Colors.white24,width: 5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Id                        :"),
                          Text('${data[index]['id']}'),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Name                 :"),
                          Text(data[index]['name']),
                        ],
                      ),
                      Row(
                        children: [
                          Text("User Name        :"),
                          Text(data[index]['username']),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Email                  :"),
                          Text(data[index]['email']),
                        ],
                      ),
                      Row(
                        children: [
                          Text("Address             :"),
                          Column(
                            children: [
                              Text('Street - ${data[index]['address']['street']}'),
                              Text('Suite - ${data[index]['address']['suite']}'),
                              Text('City - ${data[index]['address']['city']}'),
                              Text('Zipcode - ${data[index]['address']['zipcode']}'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },),
          )
        ));
  }

  List<dynamic> data=[];
  List<dynamic> dataList=[];

  getData()async
  {
    var response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    // print(response);

    if (response.statusCode==200) {
      var decode = jsonDecode(response.body);
      // log(decode.toString());

      for (int i =0 ; i<decode[i].length; i++ ){
        setState(() {
          data.add(decode[i]);
        });
        log('data ${decode[i]}');
      }
    }
  }  
  
  
}
