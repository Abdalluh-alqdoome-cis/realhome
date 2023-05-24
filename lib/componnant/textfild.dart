import 'package:flutter/material.dart';

import 'contanerround.dart';

class textfaild extends StatelessWidget {
  final String? hint;
  final IconData? iconss;
  final bool privte;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int maxLength;


  const textfaild({
    super.key,
    this.hint,
    this.iconss,
    required this.privte,
    this.controller,
    this.keyboardType,
    this.validator,
    required this.maxLength
  });

  @override
  Widget build(BuildContext context) {
    return contanerround(
        childin: TextFormField(
        obscureText: privte,
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        maxLength: maxLength,
      decoration: InputDecoration(
          hintText: hint,
          icon: Icon(
            iconss,
          )),
    ));
  }
}
