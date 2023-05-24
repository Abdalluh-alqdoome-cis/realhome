import 'package:firstapp/componnant/topstatic.dart';
import 'package:flutter/material.dart';

class contanerround extends StatelessWidget {
  final Widget childin;
  const contanerround({
    super.key,
    required this.childin,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: maincolor, borderRadius: BorderRadius.circular(29)),
      child: childin,
    );
  }
}
