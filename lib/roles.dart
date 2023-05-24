import 'package:firstapp/componnant/appbars.dart';
import 'package:firstapp/componnant/btn.dart';
import 'package:firstapp/componnant/topstatic.dart';
import 'package:firstapp/range.dart';
import 'package:flutter/material.dart';

class roles extends StatefulWidget {
  const roles({super.key});

  @override
  State<roles> createState() => _rolesState();
}

class _rolesState extends State<roles> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                color: maincolor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50))),
            height: 125,
            width: double.infinity,
            child: Column(
              children: [
                Text(
                  'Procedures must be\n confirmed before starting',
                  style: TextStyle(
                      height: 2,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: maincolor2),
                ),
              ],
            ),
          ),
          Text(
            '1- Upload pictures of the house or apartment only'.toUpperCase(),
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const Divider(
            height: 30,
            thickness: 5,
            indent: 0,
            endIndent: 100,
            color: Color.fromARGB(255, 120, 120, 120),
          ),
          Text(
            '2- Setting a specific price for the house or apartment'
                .toUpperCase(),
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const Divider(
            height: 30,
            thickness: 5,
            indent: 0,
            endIndent: 100,
            color: Color.fromARGB(255, 120, 120, 120),
          ),
          Text(
            '3- Write full house details in the description'.toUpperCase(),
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const Divider(
            height: 30,
            thickness: 5,
            indent: 0,
            endIndent: 100,
            color: Color.fromARGB(255, 120, 120, 120),
          ),
          Text(
            '4- Use effective and correct contact information'.toUpperCase(),
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const Divider(
            height: 30,
            thickness: 5,
            indent: 0,
            endIndent: 100,
            color: Color.fromARGB(255, 120, 120, 120),
          ),
          mainbtn(
              text: "continuation",
              pris: () {
                Navigator.of(context).pushNamed('select');
              })
        ]),
      ),
    );
  }
}
