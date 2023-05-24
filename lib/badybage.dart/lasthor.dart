import 'package:flutter/material.dart';

class lesthorz extends StatelessWidget {
  var img1;
  var img2;
  var img3;
  var img4;
  var img5;
  var img6;
  var img7;
  var img8;
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
    return Container(
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
