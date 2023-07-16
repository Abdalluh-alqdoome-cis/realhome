import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: camel_case_types
class addimage extends StatefulWidget {
  const addimage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _addimageState createState() => _addimageState();
}

// ignore: camel_case_types
class _addimageState extends State<addimage> {
  final List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
            icon: const Icon(
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
