import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapp/scren/bayhome/mainbay.dart';
import 'package:firstapp/componnant/appbars.dart';
import 'package:firstapp/drawer/drawer.dart';
import 'package:firstapp/componnant/topstatic.dart';
import 'package:firstapp/scren/bayhome/bay1.dart';
import 'package:firstapp/scren/bayhome/bay2.dart';
import 'package:firstapp/scren/bayhome/bay3.dart';
import 'package:firstapp/scren/renthouse/rent1.dart';
import 'package:firstapp/scren/renthouse/rent2.dart';
import 'package:firstapp/scren/renthouse/rent3.dart';
import 'package:firstapp/scren/renthouse/mainrent.dart';
import '../componnant/lestsale.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final List<Map<String, dynamic>> _saleHouse = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /* backgroundColor: backcolor,
      appBar: AppBar(
        backgroundColor: maincolor,
        automaticallyImplyLeading: false,
        title:,lText('found dream house'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
      ),*/
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 0),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: maincolor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50))),
              height: 125,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Found Dream House',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 3,
                        color: maincolor2),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: maincolor2,
                      size: 50,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('drawer');
                    },
                  )
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            padding: EdgeInsets.all(10),
            child: Text(
              'Suggested to you',
              style: TextStyle(fontSize: 25, color: maincolor),
            ),
          ),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: skne,
          ),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  lestsale(
                    imge: AssetImage('assest/images/upload.jpg'),
                    location: 'upload',
                    type: 'house',
                    price: "",
                    size: size,
                    functn: () {
                      Navigator.of(context).pushNamed('roles');
                    },
                  ),
                ],
              )),
          Row(
            children: [
              Text('Houses for sale'),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('mainbay');
                  },
                  child: Text(
                    'more',
                    style: TextStyle(
                        color: maincolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ))
            ],
          ),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: skne,
          ),
          StreamBuilder(
            stream: readSaleHouse(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Offstage();
              } else {
                return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
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

                            //Navigator.of(context).pushNamed('rent1');
                          },
                        );
                      },
                    ));
              }
            },
          ),
          Row(
            children: [
              Text('Houses offered for rent'),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('mainrent');
                  },
                  child: Text(
                    'more',
                    style: TextStyle(
                        color: maincolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ))
            ],
          ),
          const Divider(
            height: 0,
            thickness: 3,
            indent: 50,
            endIndent: 50,
            color: skne,
          ),
          StreamBuilder(
            stream: readRentHouse(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Offstage();
              } else {
                return SizedBox(
                    height: 250,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
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
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [],
              )),
        ]),
      ),
    );
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readSaleHouse() {
    return FirebaseFirestore.instance
        .collection("House")
        .where("Approve", isEqualTo: 1)
        .where("Type2", isEqualTo: 'SAL')
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> readRentHouse() {
    return FirebaseFirestore.instance
        .collection("House")
        .where("Approve", isEqualTo: 1)
        .where("Type2", isEqualTo: 'RENT')
        .snapshots();
  }
}
