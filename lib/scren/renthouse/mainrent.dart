import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/scren/renthouse/rent1.dart';
import 'package:flutter/material.dart';

import 'package:firstapp/componnant/topstatic.dart';

import '../../componnant/lestmune.dart';
import '../../componnant/lestsale.dart';
import '../../country.dart';

const List<String> _countries = [
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

class mainrent extends StatefulWidget {
  const mainrent({Key? key}) : super(key: key);

  @override
  State<mainrent> createState() => _mainrentState();
}

class _mainrentState extends State<mainrent> {
  // String dropdownCityValue = _countries.first;
  String? dropdownCityValue; // = _countries.first;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          titleSpacing: -10,
          backgroundColor: maincolor,
          title: Text(
            "house for rent".toUpperCase(),
          ),
          actions: [
            DropdownButton<String>(
              value: dropdownCityValue,
              icon: Icon(Icons.location_on, color: Colors.red),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.black, fontSize: 16),
              underline: Container(
                height: 1,
                color: Colors.grey[300],
              ),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dropdownCityValue = newValue;
                  });
                  readRentHouse();
                }
              },
              items: _countries.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              StreamBuilder(
                stream: readRentHouse(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Offstage();
                  } else {
                    return SizedBox(
                        // height: 250,
                        child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return lestsale(
                          imge: NetworkImage(
                            documentSnapshot["Images"][0],
                          ),
                          location: '${documentSnapshot["HouseDesc"]}',
                          type: '${documentSnapshot["Type"]}',
                          price: '${documentSnapshot["Price"]}',
                          size: size,
                          functn: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => rent1(
                                          images: documentSnapshot["Images"],
                                          location:
                                              documentSnapshot["LocationDesc"],
                                          name: documentSnapshot["HouseDesc"],
                                          price: documentSnapshot["Price"],
                                          type: documentSnapshot["Type"],
                                        )));
                          },
                        );
                      },
                    ));
                  }
                },
              ),
              /*bodymain(
                type: 'feal',
                price: '50,0000',
                location: 'zarqa',
                imge: AssetImage('assest/images/felarent.png'),
                functn: () {
                  Navigator.of(context).pushNamed('rent1');
                },
              ),
              bodymain(
                type: 'department',
                price: '5000',
                location: 'zarqa',
                imge: AssetImage('assest/images/houserent.png'),
                functn: () {
                  Navigator.of(context).pushNamed('rent2');
                },
              ),
              bodymain(
                type: 'department',
                price: '5000',
                location: 'zarqa',
                imge: AssetImage('assest/images/partrent.png'),
                functn: () {
                  Navigator.of(context).pushNamed('rent3');
                },
              ),
              bodymain(
                type: 'department',
                price: '500000000000000',
                location: 'zarqa',
                imge: AssetImage('assest/images/1.png'),
                functn: () {},
              ),
              bodymain(
                type: 'department',
                price: '5000000000000',
                location: 'zarqa',
                imge: AssetImage('assest/images/1.png'),
                functn: () {},
              ),
              bodymain(
                type: 'department',
                price: '5000000000000',
                location: 'zarqa',
                imge: AssetImage('assest/images/1.png'),
                functn: () {},
              )*/
            ],
          ),
        ));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readRentHouse() {
    return FirebaseFirestore.instance
        .collection("House")
        .where("Approve", isEqualTo: 1)
        .where("City", isEqualTo: dropdownCityValue)
        .where("Type2", isEqualTo: 'RENT')
        .snapshots();
  }
}
