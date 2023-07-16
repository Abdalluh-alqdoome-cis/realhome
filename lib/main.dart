import 'package:firstapp/country.dart';
import 'package:firstapp/drawer/FQA.dart';
import 'package:firstapp/drawer/changepass.dart';
import 'package:firstapp/drawer/drawer.dart';
import 'package:firstapp/componnant/topstatic.dart';
import 'package:firstapp/drawer/help.dart';
import 'package:firstapp/scren/newhoyse/roles.dart';
import 'package:firstapp/scren/bayhome/bay1.dart';
import 'package:firstapp/scren/bayhome/bay2.dart';
import 'package:firstapp/scren/bayhome/bay3.dart';
import 'package:firstapp/scren/bayhome/mainbay.dart';
import 'package:firstapp/scren/home.dart';
import 'package:firstapp/scren/autho/login.dart';
import 'package:firstapp/scren/newhoyse/slect.dart';
import 'package:firstapp/scren/renthouse/mainrent.dart';
//import 'package:firstapp/scren/renthouse/rent1.dart';
import 'package:firstapp/scren/renthouse/rent2.dart';
import 'package:firstapp/scren/renthouse/rent3.dart';
import 'package:firstapp/scren/autho/signup.dart';
import 'package:firstapp/scren/autho/welcome.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
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
      home: const welcome(),
      routes: {
        "login": (context) => const login(),
        "home": (context) => const home(),
        'signup': (context) => const sigup(),
        'drawer': (context) => const drawers(),
        'bay1': (context) => const bay1(),
        'bay2': (context) => const bay2(),
        'bay3': (context) => const bay3(),
        //'rent1': (context) => rent1(),
        'rent2': (context) => const rent2(),
        'rent3': (context) => const rent3(),
        'mainbay': (context) => const maibay(),
        'mainrent': (context) => const mainrent(),
        'select': (context) => const selct(),
        'FQA': (context) => const FQA(),
        'help': (context) => const help(),
        'pass': (context) => const change(),
        'contry': (context) => const country(),
        'roles': (context) => const roles(),
      },
    );
  }
}
