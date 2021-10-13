import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Api_4 extends StatefulWidget {
  const Api_4({Key? key}) : super(key: key);

  @override
  _Api_4State createState() => _Api_4State();
}

class _Api_4State extends State<Api_4> {

  void initState(){
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [

            ],
          );
        },
      ),
    )));
  }

  getData(){
    var response= http.get(Uri.parse('https://newsapi.org/v2/everything?q=tesla&from=2021-09-12&sortBy=publishedAt&apiKey=4dca22d74b5c464ebc539990b40198c3'));
    print(response);


  }

}
