import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_utils_class/image_utils_class.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // final picker = ImagePicker();
   TextEditingController? base64;

  @override
  void initState() {
    base64 = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dilshad"),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              MaterialButton(
                  onPressed: () async {
                    var pickedFile;
                    // await picker.getImage(source: ImageSource.gallery);
                    setState(() {
                      if (pickedFile != null) {
                        base64!.text =
                            ImageUtils.fileToBase64(File(pickedFile.path));
                      } else {
                        print('No image selected.');
                      }
                    });
                  },
                  child: Text("Select Image")),
              SizedBox(height: 10),
              Text("Base64 String of selected image:${base64!.text}"),
              SizedBox(height: 30),
              Text("Base64 to Image:"),
              CircleAvatar(
                radius: 25,
                backgroundImage: ImageUtils.base64ToImage(base64!.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}