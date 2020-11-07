import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:whatsapp_clone/controllers/bindings/authController.dart';
import 'package:whatsapp_clone/views/authViews/login.dart';
import 'package:whatsapp_clone/views/home.dart';
import 'package:whatsapp_clone/views/introView.dart';

class Root extends GetWidget<AuthController>  {
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.user==null?IntroViews():HomeScreen());
  }
}
