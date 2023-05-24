import 'package:flutter/material.dart';

import 'package:firstapp/componnant/contanerround.dart';
import 'package:firstapp/componnant/topstatic.dart';

import '../../badybage.dart/contactus.dart';
import '../../badybage.dart/deccipbox1.dart';
import '../../badybage.dart/lasthor.dart';

class bay1 extends StatelessWidget {
  const bay1({super.key});

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
            img1: AssetImage('assest/images/fealsal.png'),
            img2: AssetImage('assest/images/fealsal2.png'),
            img3: AssetImage('assest/images/fealsal3.png'),
            img4: AssetImage('assest/images/fealsal4.png'),
            img5: AssetImage('assest/images/fealsal5.png'),
            img6: AssetImage('assest/images/fealsal6.png'),
            img7: AssetImage('assest/images/fealsal7.png'),
            img8: AssetImage('assest/images/fealsal2.png'),
            img9: AssetImage('assest/images/180.png'),
          ),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: Colors.black,
          ),
          descption(
            texttype: 'feal to seal'.toUpperCase(),
            textdescr:
                'The house consists of three bedrooms \na living room\n and an outside\n gardena living room and an',
            textloca: 'The location of the house in Amman\n, Dahiet Al-Rasheed',
            price: '500,000',
          ),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: Colors.black,
          ),
          contactus(
            phone: '0790970072',
            fphone: () {},
            text: 'ahmad',
            ftext: () {},
          )
        ],
      )),
    );
  }
}
