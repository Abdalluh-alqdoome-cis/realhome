import 'package:firstapp/componnant/topstatic.dart';
import 'package:flutter/material.dart';
//import 'package:firstapp/scren/bayhome/mainbay.dart';
//import 'package:firstapp/scren/renthouse/mainrent.dart';
//import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class drawers extends StatefulWidget {
  const drawers({Key? key}) : super(key: key);

  @override
  State<drawers> createState() => _drawersState();
}

// ignore: camel_case_types
class _drawersState extends State<drawers> {
  String _userName = "";
  String _emailAddress = "";

  @override
  void initState() {
    super.initState();
    LoadPrefences();
  }

  // ignore: non_constant_identifier_names
  LoadPrefences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString('UserName')!;
    _emailAddress = prefs.getString('EmailAddress')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: maincolor,
                  maxRadius: 2,
                  backgroundImage: AssetImage("assest/images/180.png"),
                ),
                accountName: Text(_userName),
                accountEmail: Text(_emailAddress)),
            ListTile(
              title: const Text('House page'),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pushNamed('home');
              },
            ),
            ListTile(
              title: const Text('Sale House'),
              leading: const Icon(Icons.mail_rounded),
              onTap: () {
                Navigator.of(context).pushNamed('mainbay');
              },
            ),
            ListTile(
              title: const Text('Rent House'),
              leading: const Icon(Icons.point_of_sale_sharp),
              onTap: () {
                Navigator.of(context).pushNamed('mainrent');
              },
            ),
            ListTile(
              title: const Text('FQA'),
              leading: const Icon(Icons.help_center),
              onTap: () {
                Navigator.of(context).pushNamed('FQA');
              },
            ),
            ListTile(
              title: const Text('Help'),
              leading: const Icon(Icons.manage_accounts),
              onTap: () {
                Navigator.of(context).pushNamed('help');
              },
            ),
            /* ListTile(
              title: const Text('exit group'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () {
                SystemNavigator.pop();
              },
            ),*/
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.exit_to_app),
              onTap: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                prefs.remove("UserName");
                prefs.remove("EmailAddress");
                // ignore: use_build_context_synchronously
                Navigator.of(context).pushNamed('login');
              },
            )
          ],
        ),
      ),
    );
  }
}
