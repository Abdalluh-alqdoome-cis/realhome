import 'package:flutter/material.dart';
//import 'package:firstapp/componnant/contanerround.dart';
import 'package:firstapp/componnant/topstatic.dart';
//import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class mainbtn extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  var text;
  // ignore: prefer_typing_uninitialized_variables
  var pris;
  // ignore: prefer_typing_uninitialized_variables
  var dcolors, textcolor;

  mainbtn({
    Key? key,
    required this.text,
    required this.pris,
    this.textcolor = maincolor,
    this.dcolors,
  }) : super(key: key);

  @override
  State<mainbtn> createState() => _mainbtnState();
}

// ignore: camel_case_types
class _mainbtnState extends State<mainbtn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: maincolor, borderRadius: BorderRadius.circular(29)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: maincolor,
          ),
          onPressed: widget.pris,
          child: Text(
            widget.text,
          )),
    );
  }
}
/*ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            backgroundColor: maincolor,
          ),
          onPressed: widget.pris,
          child: Text(
            widget.text,
            style: TextStyle(
              color: maincolor2,
            ), 
            Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(29)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            backgroundColor: maincolor,
          ),
          onPressed: widget.pris,
          child: Text(
            widget.text,
            style: TextStyle(
              color: maincolor2,
            ),
          )),
    );
        contanerround(
        childin: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: maincolor,
            ),
            onPressed: widget.pris,
            child: Text(
              widget.text,
              style: TextStyle(
                color: maincolor2,
              ),
            )));    
            
            
            
            
            
            
            */