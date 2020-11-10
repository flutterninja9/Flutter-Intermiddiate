import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_bloc_advanced/presentation/extensions/sidebar_desktop.dart';

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SidebarDesktop(),
        ],
      ),
    );
  }
}
