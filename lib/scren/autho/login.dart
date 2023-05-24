import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/componnant/btn.dart';
import 'package:firstapp/componnant/topstatic.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../componnant/textfild.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  // declaration form
  var formKey = GlobalKey<FormState>();

  // controller name
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Validation Area
  var emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: maincolor2,
        body: SingleChildScrollView(
          child: Form(
              key: formKey,
              child: Container(
                  //margin: EdgeInsets.only(bottom: 270),
                  color: backcolor,
                  child: Column(children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30),
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 10),
                      decoration: BoxDecoration(
                          color: maincolor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      height: 125,
                      width: double.infinity,
                      child: Text(
                        'log in to continue!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            height: 2.5,
                            color: skne),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(vertical: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textfaild(
                              privte: false,
                              hint: "username",
                              iconss: Icons.person,
                              controller: _userNameController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "username is required";
                                }
                                return null;
                              },
                              maxLength: 50,
                            ),
                            textfaild(
                              privte: true,
                              hint: "password",
                              iconss: Icons.lock,
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "password is required";
                                }
                                return null;
                              },
                              maxLength: 25,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: size.width * 0.8,
                              decoration: BoxDecoration(
                                  color: maincolor,
                                  borderRadius: BorderRadius.circular(29)),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: maincolor,
                                  ),
                                  onPressed: () async {
                                    if (!formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'please fill all required data',
                                                textAlign: TextAlign.center)),
                                      );
                                      return;
                                    } else {
                                      QuerySnapshot<Map<String, dynamic>>
                                          loginData = await FirebaseFirestore
                                              .instance
                                              .collection("User")
                                              .where("UserName",
                                                  isEqualTo: _userNameController
                                                      .text
                                                      .trim())
                                              .where("Password",
                                                  isEqualTo: _passwordController
                                                      .text
                                                      .trim())
                                              .get();

                                      bool IsExists = loginData.docs.length > 0
                                          ? true
                                          : false;

                                      if (!IsExists) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text(
                                                  'user name or password not correct',
                                                  textAlign: TextAlign.center)),
                                        );
                                        return;
                                      }


                                      final SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      await prefs.setString('UserName',
                                          loginData.docs[0].data()["UserName"]);
                                      await prefs.setString('EmailAddress',
                                          loginData.docs[0].data()["Email"]);
                                      Navigator.of(context).pushNamed('home');
                                    }
                                  },
                                  child: Text('login',
                                      style: TextStyle(
                                        color: maincolor2,
                                      ))),
                            ),
                            /*mainbtn(
                            text: 'login',
                            pris: () {
                              Navigator.of(context).pushNamed('home');
                            }),*/
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'dont have an acount ?',
                                  style: TextStyle(color: skne),
                                ),
                                GestureDetector(
                                  onDoubleTap: () {
                                    Navigator.of(context).pushNamed('signup');
                                  },
                                  child: Text(
                                    'sign up',
                                    style: TextStyle(
                                        color: maincolor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )),
                  ]))),
        ));
  }
}
