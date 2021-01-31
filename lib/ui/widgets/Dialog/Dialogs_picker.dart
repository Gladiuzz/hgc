import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Dialog_picker extends StatefulWidget {
  Dialog_picker({Key key}) : super(key: key);

  @override
  _Dialog_pickerState createState() => _Dialog_pickerState();
}

class _Dialog_pickerState extends State<Dialog_picker> {
  File _image;

  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Dialog(
      child: Container(
        child: new Wrap(
          children: <Widget>[
            new ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text('Photo Library'),
                onTap: () {
                  _imgFromGallery();
                  Navigator.of(context).pop();
                }),
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title: new Text('Camera'),
              onTap: () {
                _imgFromCamera();
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
