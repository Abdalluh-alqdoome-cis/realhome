import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class lesthorz extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var img1;
  // ignore: prefer_typing_uninitialized_variables
  var img2;
  // ignore: prefer_typing_uninitialized_variables
  var img3;
  // ignore: prefer_typing_uninitialized_variables
  var img4;
  // ignore: prefer_typing_uninitialized_variables
  var img5;
  // ignore: prefer_typing_uninitialized_variables
  var img6;
  // ignore: prefer_typing_uninitialized_variables
  var img7;
  // ignore: prefer_typing_uninitialized_variables
  var img8;
  // ignore: prefer_typing_uninitialized_variables
  var img9;
  lesthorz({
    Key? key,
    required this.img1,
    required this.img2,
    this.img3,
    this.img4,
    this.img5,
    this.img6,
    this.img7,
    this.img8,
    this.img9,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView(scrollDirection: Axis.horizontal, children: [
        Image(image: img1),
        Image(image: img2),
        Image(image: img3),
        Image(image: img4),
        Image(image: img5),
        Image(image: img6),
        Image(image: img7),
        Image(image: img8),
        Image(image: img9),
      ]),
    );
  }
} 
/*
import 'dart:io';

import 'package:flutter/material.dart';

class lesthorz extends StatelessWidget {
  List<File> images = [];
  lesthorz({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Image.file(images[index]);
          },
        ));
  }
} */
