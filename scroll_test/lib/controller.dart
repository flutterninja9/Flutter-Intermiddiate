import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BaseController extends GetxController {
  var offset = (0.0).obs;
  PageController pageController = PageController();

  @override
  void onInit() {
    pageController = PageController();
    pageController.addListener(() {
      offset.value = pageController.offset;
    });
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
