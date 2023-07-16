import 'package:flutter/material.dart';

// ignore: camel_case_types, must_be_immutable
class lestsale extends StatelessWidget {
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
  lestsale({
    Key? key,
    required this.imge,
    this.location,
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
          margin: const EdgeInsets.all(8),
          width: size.width * 0.4,
          child: Column(children: [
            Image(
              image: imge,
              height: 180,
              width: double.infinity,
              centerSlice: Rect.largest,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        /*Text(
                          location,
                          style: const TextStyle(),
                        ),*/
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
          ]),
        ));
  }
}
