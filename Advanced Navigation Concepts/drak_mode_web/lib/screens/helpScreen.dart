import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  String storeID;
  Help({this.storeID});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
      ),
      body: Center(
        child: Text(storeID != null ? storeID : "Help Page"),
      ),
    );
  }
}
