import 'package:get/get.dart';
import 'package:weather_bloc_advanced/controllers/navControllers.dart';

class Navbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavController>(() => NavController());
  }
}
