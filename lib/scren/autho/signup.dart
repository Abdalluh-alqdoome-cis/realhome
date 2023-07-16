import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firstapp/componnant/btn.dart';
import 'package:firstapp/componnant/textfild.dart';
import 'package:flutter/material.dart';

import '../../componnant/topstatic.dart';

// ignore: camel_case_types
class sigup extends StatefulWidget {
  const sigup({Key? key}) : super(key: key);

  @override
  State<sigup> createState() => _sigupState();
}

// ignore: camel_case_types
class _sigupState extends State<sigup> {
  // declaration form
  var formKey = GlobalKey<FormState>();

  bool isLoading = true;

  // Validation Area
  var emailRegExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // controller name
  final _emailController = TextEditingController();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
      key: formKey,
      child: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            textfaild(
              privte: false,
              hint: 'user name',
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
              privte: false,
              hint: 'email addres',
              iconss: Icons.person,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "email is required";
                } else if (!emailRegExp.hasMatch(value)) {
                  return "not correct format must be like test@gmail.com";
                }
                return null;
              },
              maxLength: 50,
            ),
            textfaild(
              privte: true,
              hint: 'password',
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
            textfaild(
              privte: true,
              hint: 'confirm password',
              iconss: Icons.lock,
              controller: _confirmPasswordController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "password is required";
                } else if (value != _passwordController.text) {
                  return "password not match confirm password";
                }
                return null;
              },
              maxLength: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: size.width * 0.8,
              decoration: BoxDecoration(
                  color: maincolor, borderRadius: BorderRadius.circular(29)),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maincolor,
                  ),
                  onPressed: () async {
                    //print(!formKey.currentState!.validate());
                    if (!formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('please fill all required data',
                                textAlign: TextAlign.center)),
                      );
                      return;
                    } else {
                      final docType =
                          FirebaseFirestore.instance.collection("User").doc();
                      final jsonData = {
                        'Id': docType.id,
                        'Email': _emailController.text.trim(),
                        'UserName': _userNameController.text.trim(),
                        'Password': _passwordController.text.trim()
                      };

                      await docType.set(jsonData);
                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('signup Sucessfully',
                                textAlign: TextAlign.center)),
                      );
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pushNamed('login');
                    }
                  },
                  child: const Text('Create an account',
                      style: TextStyle(
                        color: maincolor2,
                      ))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('already have an acount'),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pushNamed('login');
                  },
                  child: const Text(
                    'login',
                    style: TextStyle(
                        color: maincolor, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    )));
  }
}
