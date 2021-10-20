import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'News2.dart';
import 'package:fluttertoast/fluttertoast.dart';

class News1 extends StatefulWidget {
  const News1({Key? key}) : super(key: key);

  @override
  _News1State createState() => _News1State();
}

class _News1State extends State<News1> {
  void initState() {
    super.initState();
    getData();
  }

  ScrollController _controller1 = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text('News Api Nevigating Index to next Screen'),
            ),
            body: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: ListView.builder(
                    controller: _controller1,
                    itemCount: dataList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(7),
                              child: Card(
                                child: TextButton(
                                    onPressed: () {
                                      Fluttertoast.showToast(
                                          msg:
                                          'You clicked ${dataList[index]['source']['name']}',
                                          toastLength: Toast.LENGTH_LONG,
                                          fontSize: 20,
                                          backgroundColor: Colors.green);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => News2(
                                                    dataList[index]['author'],
                                                    dataList[index]['title'],
                                                    dataList[index]
                                                        ['urlToImage'],
                                                    dataList[index]['url'],
                                                    dataList[index]['content'],
                                                    dataList[index]
                                                        ['publishedAt'],
                                                  )));
                                      // log('data lis ${dataList[index]['publishedAt']}');
                                      // log('data lis ${dataList[index]['title']}');
                                      // log('data lis ${dataList[index]['urlToImage']}');
                                      log('data lis ${dataList[index]['url']}');
                                      // log('data lis ${dataList[index]['content']}');
                                      // log('data lis ${dataList[index]['publishedAt']}');
                                    },
                                    child: Text(
                                      '${dataList[index]['source']['name']}',
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    )),
                              ))
                        ],
                      );
                    },
                  ),
                ),
              ],
            )));
  }

  List<dynamic> dataList = [];

  getData() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=6e41ac1613eb445bb528caa4aed34082'));
    print(response);
    if (response.statusCode == 200) {
      var decode = jsonDecode(response.body);

      for (int i = 0; i < decode['articles'][i].length; i++) {
        setState(() {
          dataList.add(decode['articles'][i]);
        });
        // log('data lis ${decode['articles'][i]}');
      }
    }
  }
}
