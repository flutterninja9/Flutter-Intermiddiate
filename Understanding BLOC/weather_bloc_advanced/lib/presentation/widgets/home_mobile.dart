import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_bloc_advanced/presentation/extensions/sidebar_mobile.dart';

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [SidebarMbile()],
      ),
    );
  }
}
