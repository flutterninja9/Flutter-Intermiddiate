import 'package:get/get.dart';
import 'package:quizly/models/quizModel.dart';
import 'package:quizly/services/getQuiz.dart';

class QuizController extends GetxController {
  Rx<QuizModel> model = QuizModel().obs;
  var queLen = 0.obs;
 // var quesList = List().obs;

  setData() async{
   QuizModel quizModel =  await getData();
  // for(int i=0;i<quizModel.results.length;i++) {
  //   quesList.add(quizModel.results[i]);
  // }
   queLen.update((val) {
     val = quizModel.results.length;
   });
    model.value = quizModel;
  }

  counter() {
    return queLen.value;
  }

  @override
  void onInit() async{
    await setData();
    super.onInit();
  }

}