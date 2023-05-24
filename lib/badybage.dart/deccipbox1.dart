import 'package:firstapp/componnant/topstatic.dart';
import 'package:flutter/material.dart';

class descption extends StatelessWidget {
  var texttype;
  var textdescr;
  var textloca;
  var price;

  descption({
    Key? key,
    required this.texttype,
    required this.textdescr,
    required this.textloca,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            color: maincolor, borderRadius: BorderRadius.circular(29)),
        height: 270,
        child: Column(children: [
          Text(
            texttype,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: maincolor2),
          ),
          Text(
            textdescr,
            style: TextStyle(fontSize: 22),
          ),
          const Divider(
            height: 2,
            thickness: 3,
            indent: 0,
            endIndent: 100,
            color: Color.fromARGB(255, 120, 120, 120),
          ),
          Column(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_sharp,
                    color: maincolor2,
                  ),
                  Text(
                    textloca,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.price_change,
                    color: maincolor2,
                  ),
                  Text(
                    price,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }
}
