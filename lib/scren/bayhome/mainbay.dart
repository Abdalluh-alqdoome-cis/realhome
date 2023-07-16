import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firstapp/country.dart';
import 'package:flutter/material.dart';

import 'package:firstapp/componnant/topstatic.dart';

//import '../../componnant/lestmune.dart';
import '../../componnant/lestsale.dart';
import '../renthouse/rent1.dart';

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

// ignore: camel_case_types
class maibay extends StatefulWidget {
  const maibay({Key? key}) : super(key: key);

  @override
  State<maibay> createState() => _maibayState();
}

// ignore: camel_case_types
class _maibayState extends State<maibay> {
  //String dropdownCityValue = _countries.first;
  String? dropdownCityValue; // = _countries.first;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: null,
          titleSpacing: -10,
          backgroundColor: maincolor,
          title: Text(
            "house for sale".toUpperCase(),
          ),
          actions: [
            DropdownButton<String>(
              value: dropdownCityValue,
              icon: const Icon(Icons.location_on, color: Colors.red),
              iconSize: 24,
              //elevation: 16,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              underline: Container(
                height: 1,
                color: Colors.grey[300],
              ),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() {
                    dropdownCityValue = newValue;
                  });
                  readSaleHouse();
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
                stream: readSaleHouse(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Offstage();
                  } else {
                    return SizedBox(
                        child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const ScrollPhysics(),
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

                            //Navigator.of(context).pushNamed('rent1');
                          },
                        );
                      },
                    ));
                  }
                },
              ),
              /*bodymain(
                type: 'department',
                price: '5000',
                location: 'zarqa',
                imge: AssetImage('assest/images/fealsal.png'),
                functn: () {
                  Navigator.of(context).pushNamed('bay1');
                },
              ),
              bodymain(
                type: 'department',
                price: '5000',
                location: 'zarqa',
                imge: AssetImage('assest/images/housesal.png'),
                functn: () {
                  Navigator.of(context).pushNamed('bay2');
                },
              ),
              bodymain(
                type: 'department',
                price: '5000',
                location: 'zarqa',
                imge: AssetImage('assest/images/partsal.png'),
                functn: () {
                  Navigator.of(context).pushNamed('bay3');
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
                price: '50000000000000',
                location: 'zarqa',
                imge: AssetImage('assest/images/1.png'),
                functn: () {
                  Navigator.of(context).pushNamed('bay1');
                },
              ),
              bodymain(
                type: 'department',
                price: '500000000000',
                location: 'zarqa',
                imge: AssetImage('assest/images/1.png'),
                functn: () {},
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
              )*/
            ],
          ),
        ));
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readSaleHouse() {
    return FirebaseFirestore.instance
        .collection("House")
        .where("Approve", isEqualTo: 1)
        .where("City", isEqualTo: dropdownCityValue)
        .where("Type2", isEqualTo: 'SAL')
        .snapshots();
  }
}
