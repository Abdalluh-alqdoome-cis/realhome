import 'package:flutter/material.dart';

// ignore: camel_case_types
class country extends StatefulWidget {
  const country({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _countryState createState() => _countryState();
}

// ignore: camel_case_types
class _countryState extends State<country> {
  //var selectedCountry;
  // ignore: prefer_typing_uninitialized_variables
  var all;
  final List<String> _countries = [
    'Amman',
    'Zarqa',
    'Irbid',
    'Aqaba',
    'Maan',
    'Madaba',
    'Jerash',
    'Mafraq',
    'Karak',
    'Tafilah',
    'Balqa'
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: all,
      icon: const Icon(Icons.location_on, color: Colors.red),
      iconSize: 32,
      //elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 16),
      //borderRadius: BorderRadius.all(Radius.circular(30)),

      underline: Container(
        height: 1,
        color: Colors.grey[300],
      ),
      onChanged: (String? newValue) {
        setState(() {
          all = newValue;
        });
      },
      items: _countries.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
