import 'package:firstapp/badybage.dart/contactus.dart';
import 'package:firstapp/badybage.dart/deccipbox1.dart';
import 'package:firstapp/badybage.dart/lasthor.dart';
import 'package:flutter/material.dart';

import '../../componnant/topstatic.dart';

class bay2 extends StatelessWidget {
  const bay2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        title: Text(
          'House info'.toUpperCase(),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          lesthorz(
              img1: AssetImage('assest/images/housesal.png'),
              img2: AssetImage('assest/images/housesal2.png'),
              img3: AssetImage('assest/images/housesal3.png'),
              img4: AssetImage('assest/images/housesal4.png'),
              img5: AssetImage('assest/images/housesal5.png'),
              img6: AssetImage('assest/images/housesal6.png'),
              img7: AssetImage('assest/images/housesal7.png'),
              img8: AssetImage('assest/images/180.png'),
              img9: AssetImage('assest/images/180.png')),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: Colors.black,
          ),
          descption(
              texttype: 'house to sal'.toUpperCase(),
              textdescr:
                  'The house consists of three bedrooms \na living room\n and an outside\n gardena living room and an',
              textloca: 'the location for house\n is zarqa and it is can fly ',
              price: '30,000'),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: Colors.black,
          ),
          contactus(
              phone: '0790970072', fphone: () {}, text: 'loay', ftext: () {})
        ],
      )),
    );
  }
}
