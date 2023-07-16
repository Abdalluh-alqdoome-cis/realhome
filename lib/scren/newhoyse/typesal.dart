import 'package:firstapp/componnant/topstatic.dart';
import 'package:flutter/material.dart';

const List<String> list = <String>[
  'SAL',
  'RENT',
];

// ignore: camel_case_types
class dropdown2 extends StatefulWidget {
  const dropdown2({super.key});

  @override
  State<dropdown2> createState() => _dropdown2State();
}

// ignore: camel_case_types
class _dropdown2State extends State<dropdown2> {
  String dropdown2Value = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdown2Value,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: maincolor),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdown2Value = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
