import 'package:flutter/material.dart';
import 'package:bagh_e_zahra/home.dart';

import 'initPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) => Home()),
    );
  }
}