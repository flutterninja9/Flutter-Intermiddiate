import 'package:get/get.dart';
import 'package:whatsapp_clone/controllers/bindings/authController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }

}