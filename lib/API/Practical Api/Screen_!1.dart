import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'Screen_2.dart';
import 'package:http/http.dart'as http;

class Scrren1 extends StatefulWidget {
  const Scrren1({Key? key}) : super(key: key);

  @override
  _Scrren1State createState() => _Scrren1State();
}

class _Scrren1State extends State<Scrren1> {
  List<String> listitems = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: listitems.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen_2()));
                },
                child: Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey,
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                      child: Text(
                    listitems[index],
                  )),
                ),
              ),

            ],
          );
        },
      ),
    ));
  }
}
