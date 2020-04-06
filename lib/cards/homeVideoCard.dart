import 'package:flutter/material.dart';
class HomeVideoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/honeycomb.png"), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5)),
        child: Text("data"),
      ),
    );
  }
}