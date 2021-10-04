import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  late SharedPreferences logindata;

  String? firstname;
  String? name;
  String? email;
  String? dils;
  String? path;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      firstname=logindata.getString('Fname');
      print(firstname);
      name=logindata.getString('lName');
      print(name);
      email=logindata.getString('address');
      print(email);
      dils=logindata.getString('dils').toString();
      // dils=logindata.getString('dils');
      print(dils);
      path=logindata.getString('imagepath');
      print(path);

      // name = logindata.getString('firstname')!;
      // email = logindata.getString('name')!;
      // firstname = logindata.getString('email')!;
      // print('email address   :$firstname');
      // dils=logindata.getString('dils');
      // print('images saved to string : $dils');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Shared Preferences"),
            ),
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('$name'),
                    accountEmail: Text("$firstname"),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        "A",
                        style: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text("Home"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.contacts),
                    title: Text("Contact Us"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            body: Container(
                color: Colors.red,
                height: 500,
                child: Image.file(File(path!)
                )
            )
        )
    );
  }
}
