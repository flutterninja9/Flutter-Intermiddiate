import 'package:get/get.dart';

class NavController extends GetxController {
  var pageCounter = 0.obs;

  switchPage({pageIndex}) {
    pageCounter.value = pageIndex;
  }
}
