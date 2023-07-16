import 'package:firstapp/componnant/btn.dart';

//import 'package:firstapp/scren/home.dart';
//import 'package:firstapp/scren/autho/login.dart';
import 'package:flutter/material.dart';

import '../../componnant/topstatic.dart';

// ignore: camel_case_types
class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

// ignore: camel_case_types
class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backcolor,
      body: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: const BoxDecoration(
              color: maincolor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50))),
          height: 125,
          width: double.infinity,
          child: const Column(
            children: [
              Text(
                'Welcome To Realstate',
                style: TextStyle(
                    height: 2,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: maincolor2),
              ),
              Text(
                'Rent & Buy',
                style: TextStyle(
                  height: 2,
                  fontSize: 22,
                  color: maincolor2,
                ),
              ),
            ],
          ),
        ),
        const Image(
          image: AssetImage('assest/images/1.png'),
          height: 350,
        ),
        mainbtn(
            text: 'login',
            pris: () {
              Navigator.of(context).pushNamed('login');
            }),
        mainbtn(
            text: 'sign up',
            pris: () {
              Navigator.of(context).pushNamed('signup');
            }),

        /*  ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed("home");
            },
          child: Text('data')) */
      ]),
    );
  }
}
