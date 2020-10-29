import 'package:get/get.dart';
import 'package:spotify_web_clone/controllers/playlistFetchController.dart';

class PlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PLayListController>(() => PLayListController());
  }

}