import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class bodymain extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var imge;
  // ignore: prefer_typing_uninitialized_variables
  var location;
  // ignore: prefer_typing_uninitialized_variables
  var type;
  // ignore: prefer_typing_uninitialized_variables
  var price;
  // ignore: prefer_typing_uninitialized_variables
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
      margin: const EdgeInsets.all(8),
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
              decoration: const BoxDecoration(
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
                          style: const TextStyle(),
                        ),
                        Text(
                          type,
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                    Text(
                      price.toUpperCase(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ]),
            )
          ])),
    );
  }
}
