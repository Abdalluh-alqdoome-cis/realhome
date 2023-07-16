import 'package:flutter/material.dart';

import '../../badybage.dart/contactus.dart';
import '../../badybage.dart/deccipbox1.dart';
//import '../../badybage.dart/lasthor.dart';
//import '../../componnant/lestsale.dart';
import '../../componnant/topstatic.dart';

// ignore: camel_case_types
class rent1 extends StatefulWidget {
  final List<dynamic> images;
  final String location;
  final String name;
  final String price;
  final String type;

  const rent1(
      {Key? key,
      required this.images,
      required this.location,
      required this.name,
      required this.price,
      required this.type})
      : super(key: key);

  @override
  State<rent1> createState() => _rent1State();
}

// ignore: camel_case_types
class _rent1State extends State<rent1> {
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
          SizedBox(
              height: 250,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const ScrollPhysics(),
                itemCount: widget.images.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                      width: 150,
                      height: 250,
                      child: Image.network(
                        height: 250,
                        width: 150,
                        widget.images[index].toString(),
                      ));
                },
              )),
          /*lesthorz(
                img1: NetworkImage(
                  widget.images[0],
                ),
                img2: AssetImage('assest/images/felarent2.png'),
                img3: AssetImage('assest/images/felarent3.png'),
                img4: AssetImage('assest/images/felarent4.png'),
                img5: AssetImage('assest/images/felarent5.png'),
                img6: AssetImage('assest/images/felarent6.png'),
                img7: AssetImage('assest/images/felarent7.png'),
                img8: AssetImage('assest/images/felarent8.png'),
                img9: AssetImage('assest/images/180.png'),
              ),*/
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: Colors.black,
          ),
          descption(
              texttype: widget.type,
              textdescr: widget.name,
              textloca: widget.location,
              price: widget.price),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: Colors.black,
          ),
          contactus(phone: '962790970072', text: 'message')
        ],
      )),
    );
  }
}
