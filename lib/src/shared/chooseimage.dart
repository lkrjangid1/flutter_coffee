import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttercoffee/src/page/auth/register_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';


class ChooseImage extends StatefulWidget {
  @override
  _ChooseImageState createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {


  @override
  Widget build(BuildContext context) {
     return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Make your choice",
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          ListTile(
            onTap: () {
              openGallary();
            },
            contentPadding: const EdgeInsets.only(left: 10, right: 20),
            leading: Icon(Icons.folder),
            title: Text(
              "Gallery",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              openCamera();
            },
            contentPadding: const EdgeInsets.only(left: 10),
            leading: Icon(Icons.camera_alt),
            title: Text(
              "Camera",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future openGallary() async {
    final File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      RegisterScreenPageWidget.image = picture;

    });
    Navigator.pop(context);
  }

  Future<void> openCamera() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      RegisterScreenPageWidget.image = picture;
    });
    Navigator.pop(context);
  }

   Widget decideImageView() {
    if (RegisterScreenPageWidget.image == null) {
      return Icon(Icons.ac_unit);
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          height: 180,
          child: Image.file(
            RegisterScreenPageWidget.image,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
