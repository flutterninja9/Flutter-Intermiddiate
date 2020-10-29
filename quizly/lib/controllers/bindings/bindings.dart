import 'package:get/get.dart';
import 'package:quizly/controllers/quizController.dart';

class QuizBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizController>(() => QuizController());
  }

}