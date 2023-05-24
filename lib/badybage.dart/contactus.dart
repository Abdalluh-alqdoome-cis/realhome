import 'package:flutter/material.dart';

import '../componnant/topstatic.dart';

class contactus extends StatelessWidget {
  var phone;
  var fphone;
  var text;
  var ftext;
  contactus({
    Key? key,
    required this.phone,
    required this.fphone,
    required this.text,
    required this.ftext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: maincolor, borderRadius: BorderRadius.circular(29)),
      height: 90,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            'To contact us',
            style: TextStyle(
                fontSize: 18, color: skne, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(Icons.phone),
              TextButton(
                onPressed: fphone,
                child: Text(
                  phone,
                  style: TextStyle(color: skne),
                ),
              ),
              Icon(Icons.messenger_outline),
              TextButton(
                onPressed: ftext,
                child: Text(text, style: TextStyle(color: skne)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
