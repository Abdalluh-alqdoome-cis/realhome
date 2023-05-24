import 'package:flutter/material.dart';

class bodymain extends StatelessWidget {
  var imge;
  var location;
  var type;
  var price;
  var functn;
  bodymain({
    super.key,
    required this.imge,
    required this.location,
    required this.type,
    required this.price,
    required this.functn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: GestureDetector(
          onTap: functn,
          child: Column(children: [
            Image(
              image: imge,
              height: 200,
              width: double.infinity,
              centerSlice: Rect.largest,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              /* boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
              ]),
                )*/
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          location,
                          style: TextStyle(),
                        ),
                        Text(
                          type,
                          style: TextStyle(),
                        ),
                      ],
                    ),
                    Text(
                      price.toUpperCase(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ]),
            )
          ])),
    );
  }
}
