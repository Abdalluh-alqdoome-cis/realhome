import 'package:flutter/material.dart';

class lestsale extends StatelessWidget {
  var imge;
  var location;
  var type;
  var price;
  var functn;
  lestsale({
    Key? key,
    required this.imge,
    required this.location,
    required this.type,
    required this.price,
    required this.functn,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: functn,
        child: Container(
          margin: EdgeInsets.all(8),
          width: size.width * 0.4,
          child: Column(children: [
            Image(
              image: imge,
              height: 180,
              width: double.infinity,
              centerSlice: Rect.largest,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
          ]),
        ));
  }
}
