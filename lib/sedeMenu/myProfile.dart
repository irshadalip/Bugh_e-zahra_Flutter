import 'package:flutter/material.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.green[600], Colors.green[200]],
          )),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.green[50],
                Colors.green[100],
                Colors.green[100],
                Colors.green[50]
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.30, 0.25, 0.70, 0.70]),
        ),
        child: Center(
            child: Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(width: 5, color: Colors.green[50]),
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://flutter-examples.com/wp-content/uploads/2019/09/sample_image.jpg'))),
        )),
      ),
    );
  }
}
