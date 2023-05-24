import 'package:flutter/material.dart';

class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {
  //var selectedCountry;
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
      icon: Icon(Icons.location_on, color: Colors.red),
      iconSize: 24,
      //elevation: 16,
      style: TextStyle(color: Colors.black, fontSize: 16),
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
