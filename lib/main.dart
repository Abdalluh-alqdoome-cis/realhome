import 'package:firstapp/country.dart';
import 'package:firstapp/drawer/FQA.dart';
import 'package:firstapp/drawer/changepass.dart';
import 'package:firstapp/drawer/drawer.dart';
import 'package:firstapp/componnant/topstatic.dart';
import 'package:firstapp/drawer/help.dart';
import 'package:firstapp/roles.dart';
import 'package:firstapp/scren/bayhome/bay1.dart';
import 'package:firstapp/scren/bayhome/bay2.dart';
import 'package:firstapp/scren/bayhome/bay3.dart';
import 'package:firstapp/scren/bayhome/mainbay.dart';
import 'package:firstapp/scren/home.dart';
import 'package:firstapp/scren/autho/login.dart';
import 'package:firstapp/scren/newhoyse/slect.dart';
import 'package:firstapp/scren/renthouse/mainrent.dart';
import 'package:firstapp/scren/renthouse/rent1.dart';
import 'package:firstapp/scren/renthouse/rent2.dart';
import 'package:firstapp/scren/renthouse/rent3.dart';
import 'package:firstapp/scren/autho/signup.dart';
import 'package:firstapp/scren/welcome.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: maincolor, scaffoldBackgroundColor: backcolor),
      home: welcome(),
      routes: {
        "login": (context) => login(),
        "home": (context) => home(),
        'signup': (context) => sigup(),
        'drawer': (context) => drawers(),
        'bay1': (context) => bay1(),
        'bay2': (context) => bay2(),
        'bay3': (context) => bay3(),
        //'rent1': (context) => rent1(),
        'rent2': (context) => rent2(),
        'rent3': (context) => rent3(),
        'mainbay': (context) => maibay(),
        'mainrent': (context) => mainrent(),
        'select': (context) => selct(),
        'FQA': (context) => FQA(),
        'help': (context) => help(),
        'pass': (context) => change(),
        'contry': (context) => country(),
        'roles': (context) => roles(),
      },
    );
  }
}
