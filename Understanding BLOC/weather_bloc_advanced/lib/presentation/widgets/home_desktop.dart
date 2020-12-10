import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_bloc_advanced/presentation/extensions/sidebar_desktop.dart';
import 'package:weather_bloc_advanced/presentation/widgets/right_dashboard_desktop.dart';

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [SidebarDesktop(), RightBodyDesktop()],
      ),
    );
  }
}
