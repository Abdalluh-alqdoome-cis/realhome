import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firstapp/country.dart';
import 'package:firstapp/scren/newhoyse/addimage.dart';
import 'package:firstapp/scren/newhoyse/addtext.dart';
import 'package:firstapp/scren/newhoyse/typeof.dart';
import 'package:firstapp/scren/newhoyse/typesal.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../badybage.dart/contactus.dart';
import '../../componnant/topstatic.dart';

const List<String> listCity = ['Amman', 'Zarqa', 'Irbid', 'Aqaba', 'Maan', 'Madaba', 'Jerash', 'Mafraq', 'Karak', 'Tafilah', 'Balqa'];
const List<String> list = <String>['PARTMENT', 'HOUSE', 'FELA'];
const List<String> list2 = <String>['SAL', 'RENT'];

class selct extends StatefulWidget {
  const selct({super.key});

  @override
  State<selct> createState() => _selctState();
}

class _selctState extends State<selct> {
  // declaration form
  var formKey = GlobalKey<FormState>();

  String dropdownCityValue = listCity.first;
  String dropdownValue = list.first;
  String dropdown2Value = list2.first;

  final _text1Controller = TextEditingController();
  final _text2Controller = TextEditingController();
  final _text3Controller = TextEditingController();

  String text1 = '';
  String text2 = '';
  String text3 = '';

  List<File> _images = [];
  List<String> imagesUrls = [];

  final FirebaseStorage fstorage = FirebaseStorage.instance;
  late UploadTask uploadTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 70,
          backgroundColor: maincolor,
          title: Text(
            'add house'.toUpperCase(),
          ),
          actions: [country()],
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
              child: Column(children: [
            Container(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.file(_images[index]);
                },
              ),
            ),
            IconButton(
                alignment: Alignment.bottomRight,
                onPressed: _pickImage,
                icon: Icon(
                  Icons.add_a_photo,
                )),
            const Divider(
              height: 2,
              thickness: 3,
              indent: 0,
              endIndent: 100,
              color: Color.fromARGB(255, 120, 120, 120),

            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 150,
                      child: DropdownButtonFormField<String>(
                        value: dropdownCityValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 20,
                        style: const TextStyle(color: maincolor),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownCityValue = value!;
                          });
                        },
                        items: listCity.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 20,
                    style: const TextStyle(color: maincolor),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                /**/
                Text('of'.toUpperCase()),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField<String>(
                    value: dropdown2Value,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 20,
                    style: const TextStyle(color: maincolor),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        dropdown2Value = value!;
                      });
                    },
                    items: list2.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            TextField(
              controller: _text1Controller,
              onChanged: (value) {
                setState(() {
                  text1 = value;
                });
              },
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: 'Description The House',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29))),
            ),
            TextField(
              controller: _text2Controller,
              onChanged: (value) {
                setState(() {
                  text2 = value;
                });
              },
              maxLines: 2,
              decoration: InputDecoration(
                  hintText: 'Description location',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29))),
            ),
            TextField(
              controller: _text3Controller,
              onChanged: (value) {
                setState(() {
                  text3 = value;
                });
              },
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: 'Add The Price',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(29))),
            ),
            //addtext(),
            const Divider(
              height: 2,
              thickness: 3,
              indent: 0,
              endIndent: 100,
              color: Color.fromARGB(255, 120, 120, 120),
            ),
            contactus(
                phone: '0790970072', fphone: () {}, text: 'text', ftext: () {}),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: maincolor, borderRadius: BorderRadius.circular(29)),
                height: 90,
                width: double.infinity,
                child: Row(
                  children: [
                    Icon(
                      Icons.upload,
                      size: 50,
                      color: skne,
                    ),
                    TextButton(
                        onPressed: () async {
                          if (_images.length == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'please select at least one image',
                                      textAlign: TextAlign.center)),
                            );
                            return;
                          }

                          if (!formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('please fill all required data',
                                      textAlign: TextAlign.center)),
                            );
                            return;
                          } else {

                            final docType = FirebaseFirestore.instance
                                .collection("House")
                                .doc();
                            final jsonData = {
                              'Id': docType.id,
                              'HouseDesc': _text1Controller.text.trim(),
                              'LocationDesc': _text2Controller.text.trim(),
                              'Price': _text3Controller.text.trim(),
                              'Type': dropdownValue,
                              'Type2': dropdown2Value,
                              'City': dropdownCityValue,
                              'Images': imagesUrls,
                              'Approve': 0
                            };

                            await docType.set(jsonData);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('send your reqest Sucessfully',
                                      textAlign: TextAlign.center)),
                            );
                            Navigator.of(context).pushNamed('home');
                          }

                          /*final snackBar = SnackBar(
                              content: const Text('send your reqest'),
                              action: SnackBarAction(
                                  label: 'Undo',
                                  onPressed: () {
                                    // Some code to undo the change.
                                  }));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);*/
                        },
                        child: Text('upload new house',
                            style: TextStyle(color: skne, fontSize: 30)))
                  ],
                )),
          ])),
        ));
  }

  Future<void> createFirebaseImageURL(File image) async {
    String filePath = "${_text1Controller.text.length == 0 ? "New House " : _text1Controller.text.trim() }/${image.path.split('/').last}";
    setState(() {
      uploadTask = fstorage.ref().child(filePath).putFile(image);
    });
    var imageUrl = await (await uploadTask).ref.getDownloadURL();

    print(imageUrl);
    setState(() {
      imagesUrls.add(imageUrl.toString());
    });
  }

  void _pickImage() async {
    if(_text1Controller.text.length > 0 ){
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _images.add(File(pickedFile.path));
        });
        createFirebaseImageURL(File(pickedFile.path));
      }
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('select house description first',
                textAlign: TextAlign.center)),
      );
    }

  }
}
