import 'package:firstapp/componnant/btn.dart';
import 'package:flutter/material.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("help you"),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 30, left: 35),
          child: Column(children: [
            mainbtn(
              text: (' change Password'),
              pris: () {
                Navigator.of(context).pushNamed('pass');
              },
              dcolors: Colors.red,
              textcolor: Colors.white,
            ),
            mainbtn(
              text: (' call us'),
              pris: () {
                Navigator.of(context).pushNamed('pass');
              },
              dcolors: Colors.red,
              textcolor: Colors.white,
            ),
            mainbtn(
              text: ('send email'),
              pris: () {
                Navigator.of(context).pushNamed('pass');
              },
              dcolors: Colors.red,
              textcolor: Colors.white,
            )
          ]),
        ));
  }
}
