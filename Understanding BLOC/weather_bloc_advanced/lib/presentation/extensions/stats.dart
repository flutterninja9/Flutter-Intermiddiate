import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width - 230,
      child: Center(
        child: Text('Statistics'),
      ),
    );
  }
}
