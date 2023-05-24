import 'package:firstapp/componnant/topstatic.dart';
import 'package:flutter/material.dart';
import 'package:firstapp/scren/bayhome/mainbay.dart';
import 'package:firstapp/scren/renthouse/mainrent.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class drawers extends StatefulWidget {
  const drawers({Key? key}) : super(key: key);

  @override
  State<drawers> createState() => _drawersState();
}

class _drawersState extends State<drawers> {
  String _userName = "";
  String _emailAddress = "";

  @override
  void initState() {
    super.initState();
    LoadPrefences();
  }

  LoadPrefences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString('UserName')!;
    _emailAddress = prefs.getString('EmailAddress')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: maincolor,
                    maxRadius: 2,
                    backgroundImage: AssetImage("assest/images/180.png"),
                  ),
                  accountName: Text("$_userName"),
                  accountEmail: Text("$_emailAddress")),
              ListTile(
                title: Text('House page'),
                leading: Icon(Icons.home),
                onTap: () {
                  Navigator.of(context).pushNamed('home');
                },
              ),
              ListTile(
                title: Text('Sale House'),
                leading: Icon(Icons.mail_rounded),
                onTap: () {
                  Navigator.of(context).pushNamed('mainbay');
                },
              ),
              ListTile(
                title: Text('Rent House'),
                leading: Icon(Icons.point_of_sale_sharp),
                onTap: () {
                  Navigator.of(context).pushNamed('mainrent');
                },
              ),
              ListTile(
                title: Text('FQA'),
                leading: Icon(Icons.help_center),
                onTap: () {
                  Navigator.of(context).pushNamed('FQA');
                },
              ),
              ListTile(
                title: Text('Help'),
                leading: Icon(Icons.manage_accounts),
                onTap: () {
                  Navigator.of(context).pushNamed('help');
                },
              ),
              ListTile(
                title: Text('exit group'),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  SystemNavigator.pop();
                },
              ),
              ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.exit_to_app),
                onTap: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove("UserName");
                  prefs.remove("EmailAddress");
                  Navigator.of(context).pushNamed('login');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
