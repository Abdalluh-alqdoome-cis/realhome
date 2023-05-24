import 'package:firstapp/componnant/contanerround.dart';
import 'package:firstapp/componnant/topstatic.dart';
import 'package:flutter/material.dart';

class mainbtn extends StatefulWidget {
  var text;
  var pris;
  var dcolors, textcolor;

  mainbtn({
    Key? key,
    required this.text,
    required this.pris,
    this.textcolor = maincolor,
    this.dcolors,
  }) : super(key: key) {}

  @override
  State<mainbtn> createState() => _mainbtnState();
}

class _mainbtnState extends State<mainbtn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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