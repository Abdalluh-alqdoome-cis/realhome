import 'package:flutter/material.dart';

import '../../badybage.dart/contactus.dart';
import '../../badybage.dart/deccipbox1.dart';
import '../../badybage.dart/lasthor.dart';
import '../../componnant/topstatic.dart';

class bay3 extends StatelessWidget {
  const bay3({super.key});

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
            img1: AssetImage('assest/images/partsal.png'),
            img2: AssetImage('assest/images/partsel.png'),
            img3: AssetImage('assest/images/partsel2.png'),
            img4: AssetImage('assest/images/partsel3.png'),
            img5: AssetImage('assest/images/partsel4.png'),
            img6: AssetImage('assest/images/partsel5.png'),
            img7: AssetImage('assest/images/partsel6.png'),
            img8: AssetImage('assest/images/180.png'),
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
              texttype: 'fela sals',
              textdescr:
                  'h\ndمنزل يتكون من 8غرف و7 صالون و11 حمام والعديد من الاضات',
              textloca: 'the location for house\n is aman and it is can fly ',
              price: '40000'),
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