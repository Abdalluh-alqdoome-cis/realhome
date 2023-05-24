import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class addimage extends StatefulWidget {
  @override
  _addimageState createState() => _addimageState();
}

class _addimageState extends State<addimage> {
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _images.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.file(_images[index]);
            },
          ),
        ),
        IconButton(
            alignment: Alignment.bottomRight,
            onPressed: _pickImage,
            icon: Icon(
              Icons.add_a_photo,
            )),
      ],
    );
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }
}
