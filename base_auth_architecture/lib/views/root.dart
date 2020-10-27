import 'package:base_auth_architecture/controllers/authController.dart';
import 'package:base_auth_architecture/views/login.dart';
import 'package:base_auth_architecture/views/mainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.user==null?Login():MainScreen();
    });
  }
}
