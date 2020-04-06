import 'package:flutter/material.dart';
import 'package:bugh_e_zahra/sedeMenu/settings.dart';
import 'package:bugh_e_zahra/sedeMenu/myProfile.dart';
import 'package:bugh_e_zahra/sedeMenu/aboutUs.dart';

class SideMenu extends StatefulWidget {
  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Draver"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.green[600], Colors.green[200]])),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.green[50], Colors.green[100]],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.5, 0.53])),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Settings()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.archive,
                color: Colors.green,
              ),
              title: Text(
                "AboutUs",
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUs()));
              },
            ),
            Divider(
              color: Colors.green,
              indent: 16,
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                // Icons.panorama_fish_eye,
                color: Colors.green,
              ),
              title: Text(
                "My Profile",
                style: TextStyle(color: Colors.green),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfile()));
              },
            )
          ],
        ),
      ),
    );
  }
}
