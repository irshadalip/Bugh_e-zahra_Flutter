import 'package:flutter/material.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.green[50], Colors.green[100]],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0.5]),
          color: Colors.blue,
        ),
        child: Text("Page-4"));
  }
}