import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../componnant/topstatic.dart';

// ignore: camel_case_types, must_be_immutable
class contactus extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var phone;
  // ignore: prefer_typing_uninitialized_variables
  var text;
  contactus({
    Key? key,
    required this.phone,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          color: maincolor, borderRadius: BorderRadius.circular(29)),
      height: 90,
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'To contact us',
            style: TextStyle(
                fontSize: 18, color: skne, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.phone),
              TextButton(
                onPressed: () {
                  // open calling
                  // ignore: deprecated_member_use
                  launch("tel://00$phone");
                },
                child: Text(
                  phone,
                  style: const TextStyle(color: skne),
                ),
              ),
              const Icon(Icons.messenger_outline),
              TextButton(
                onPressed: () {
                  launchURLWhatsApp(phone);
                },
                child: Text(text, style: const TextStyle(color: skne)),
              ),
            ],
          )
        ],
      ),
    );
  }

  launchURLWhatsApp(String phone) async {
    var whatsapp = phone;
    var whatsappurlAndroid = "whatsapp://send?phone=$whatsapp&text=مرحبا";
    var whatappurlIos = "https://wa.me/$whatsapp?text=${Uri.parse("مرحبا")}";
    if (Platform.isIOS) {
      // for iOS phone only
      // ignore: deprecated_member_use
      if (await canLaunch(whatappurlIos)) {
        // ignore: deprecated_member_use
        await launch(whatappurlIos, forceSafariVC: false);
      }
    } else {
      // android , web
      // ignore: deprecated_member_use
      if (await canLaunch(whatsappurlAndroid)) {
        // ignore: deprecated_member_use
        await launch(whatsappurlAndroid);
      }
    }
  }
}
