import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superchat/controllers/authController.dart';
import 'package:superchat/views/authentication/home.dart';
import 'package:superchat/views/authentication/login.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.userInfo == null ? Login() : Home());
  }
}
