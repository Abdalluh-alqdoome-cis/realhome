import 'package:flutter/material.dart';

// ignore: camel_case_types
class addtext extends StatefulWidget {
  const addtext({super.key});

  @override
  State<StatefulWidget> createState() {
    return _addtextState();
  }
}

// ignore: camel_case_types
class _addtextState extends State<addtext> {
  String text1 = '';
  String text2 = '';
  String text3 = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              text1 = value;
            });
          },
          maxLines: 4,
          decoration: InputDecoration(
              hintText: 'description the house',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(29))),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              text2 = value;
            });
          },
          maxLines: 2,
          decoration: InputDecoration(
              hintText: 'description alocation',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(29))),
        ),
        TextField(
          onChanged: (value) {
            setState(() {
              text3 = value;
            });
          },
          maxLines: 1,
          decoration: InputDecoration(
              hintText: 'add the price',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(29))),
        ),
        // Text(text1),
        // Text(text2),
        // Text(text3),
      ],
    );
  }
}
