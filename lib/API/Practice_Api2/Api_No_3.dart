import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api_3 extends StatefulWidget {
  const Api_3({Key? key}) : super(key: key);

  @override
  _Api_3State createState() => _Api_3State();
}

class _Api_3State extends State<Api_3> {
  @override
  void initState() {
    super.initState();
    getData();
  }
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
          ),
          backgroundColor: Colors.lightBlueAccent,
      body: Container(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 40,
              shadowColor: Colors.blue,
              borderOnForeground: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200),
                side: BorderSide(color: Colors.green,width: 10)
              ),
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.all(80),
                child: Column(
                  children: [
                    Card(
                      elevation: 0,
                      color: Colors.white24,
                      child: Row(
                        children: [
                          Text('Use Id :'),
                          Text('${data[index]['userId']}'),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      color: Colors.white24,
                      child: Row(
                        children: [
                          Text('        Id :'),
                          Text('${data[index]['id']}'),
                        ],
                      ),
                    ),

                    Card(
                      elevation: 0,
                      color: Colors.white24,
                      child: Row(
                        children: [
                          Text('   Tittle :'),
                          Expanded(child: Text('${data[index]['title']}')),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0,
                      color: Colors.white24,
                      child: Row(
                        children: [
                          Text('   Body :'),
                          Expanded(child: Text('${data[index]['body']}')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ));
  }

  List<dynamic> data = [];

  getData() async {
    var responce =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'),

        );
    print(responce);
    if (responce.statusCode == 200) {
      var decode = jsonDecode(responce.body);
      print(decode);

      for (int i = 0; i < decode[i].length; i++) {
        setState(() {
          data.add(decode[i]);
        });
        log('data ${decode[i]}');
      }
    }
    ;
  }
}
