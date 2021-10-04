import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  /// Variables
   File ?imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return Column(
              children: [
                TextButton(onPressed: () {
                  _getFromCamera();
                }, child: Text("Image from Camera")
                ),
                TextButton(onPressed: () {
                  _getFromGallery();

                }, child: Text("Image from galary")

                )
              ],
            );
          },);

          },
          child: Icon(Icons.camera_alt),
        ),

      body: Container(
        child: imageFile == null?Text("image not loded"):
        Container(
                    child: Image.file(
                      imageFile!,
                      fit: BoxFit.cover,
        ))
      ),
    );
  }
  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
}