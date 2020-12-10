import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width - 230,
        child: Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 8),
          child: Column(
            children: [
              //NavBar containing search and userData
              Expanded(
                flex: 1,
                child: Container(color: Colors.green, child: Row()),
              ),

              //Mid Section Containing Weather Forecast
              Expanded(
                flex: 4,
                child: Container(color: Colors.amber, child: Row()),
              ),

              //Mid Section Containing Future Weather Cards
              Expanded(
                flex: 4,
                child: Container(color: Colors.deepPurple, child: Row()),
              ),

              //Footer Containing Weather Graph
              Expanded(
                flex: 7,
                child: Container(color: Colors.cyan, child: Row()),
              ),
            ],
          ),
        ));
  }
}
