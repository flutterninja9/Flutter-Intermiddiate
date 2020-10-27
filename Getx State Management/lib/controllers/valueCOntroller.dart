import 'package:get/get.dart';
import 'package:understanding_getx_sm/models/valuemodels.dart';

class ValueControllers extends GetxController {
  final valueModels = ValueModels().obs;

  changeTheValues({senA,senB}) {
    valueModels.update((model) {
      model.senA=senA;
      model.senB=senB;
    });
  }
}