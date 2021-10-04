import 'dart:convert';
import 'dart:io';

import 'package:appwork/Shared%20Preference/page4.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {


  TextEditingController namecntrl = TextEditingController();
  TextEditingController lstnamecntrl = TextEditingController();
  TextEditingController emailcntrl = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }

  void check_if_already_login() async {
    logindata = await SharedPreferences.getInstance();

    newuser = (logindata.getBool('login') ?? true);
    print(newuser);
    if (newuser == false) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const home()));
    }
  }

  File ?imageFile;
  File ?img64;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
           InkWell(
             onTap: () {
               _getFromGallery();

             },
             child: CircleAvatar(
               radius: 70,
               child: imageFile==null?Text("no image loaded"):CircleAvatar(
                 child: Image.file(imageFile!,fit: BoxFit.cover,),
               ),
             ),
           ),
             TextFormField(
               controller: namecntrl,
               decoration: InputDecoration(
                 hintText: "Name"
               ),
             ),
             TextFormField(
               controller:lstnamecntrl ,
               decoration: InputDecoration(
                 hintText: "Firstname"
               ),
             ),
             TextFormField(
               controller: emailcntrl,
               decoration: InputDecoration(
                 hintText: "Email"
               ),
             ),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                String name = namecntrl.text;
                String firstname = lstnamecntrl.text;
                String email = emailcntrl.text;
                String image = img64.toString();
                print('image encode string:$image');
                String path =imageFile!.path;
                print('image patha  :$path');

                if (name != '' && firstname != '') {
                  print('Successful');
                  logindata.setString('Fname', firstname);
                  logindata.setString('imagepath', path);
                  print('image path location :$logindata');
                  logindata.setString('lName', name);
                  logindata.setString('address', email);
                  print('email address  : $logindata');
                 logindata.setString('dils', image);
                 print('save to string :$logindata');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  home()));
                }
              },
            )
          ],
        ),
      ),
    ));
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,

);
    if (pickedFile!=null){
  setState(() {
    imageFile = File(pickedFile.path);
   // final imageFile = File(pickedFile.path).readAsBytesSync();
    final bytes =File(pickedFile.path).readAsBytesSync();
    String img64 = base64Encode(bytes);

    print('sfsjdfs$img64');
    print('sdfhjdjakdkakfd$imageFile');

  });
}
  }
}
