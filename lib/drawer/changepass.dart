import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/componnant/btn.dart';
import 'package:firstapp/componnant/textfild.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../componnant/topstatic.dart';

class change extends StatefulWidget {
  const change({super.key});

  @override
  State<change> createState() => _changeState();
}

class _changeState extends State<change> {

  // declaration form
  var formKey = GlobalKey<FormState>();

  // controller name
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("change password"),
      ),
      body: Form(
        key: formKey,
        child: Container(
          child: Column(
            children: [
              textfaild(
                privte: true,
                hint: 'password',
                iconss: Icons.lock,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
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
                validator: (value){
                  if(value!.isEmpty){
                    return "password is required";
                  }
                  else if(value != _passwordController.text){
                    return "password not match confirm password";
                  }
                  return null;
                },
                maxLength: 25,
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                width: size.width * 0.8,
                decoration: BoxDecoration(color: maincolor, borderRadius: BorderRadius.circular(29)),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: maincolor,
                    ),
                    onPressed: () async {
                      if (!formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('please fill all required data',textAlign: TextAlign.center)),
                        );
                        return;
                      }
                      else{
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        String? _username =  await prefs.getString('UserName');

                        QuerySnapshot<Map<String, dynamic>>
                        userData = await FirebaseFirestore.instance.collection("User").where("UserName",isEqualTo: _username).get();

                        await FirebaseFirestore.instance
                            .collection("User")
                            .doc(userData.docs[0].data()["Id"])
                            .update({"Password": _passwordController.text.trim()});

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Change password Sucessfully',textAlign: TextAlign.center)),
                        );
                        Navigator.of(context).pushNamed('home');
                      }
                    },
                    child: Text('change Password',
                        style: TextStyle(
                          color: maincolor2,
                        ))),
              ),

            ],
          ),
        ),
      ),
    );
  }



}
