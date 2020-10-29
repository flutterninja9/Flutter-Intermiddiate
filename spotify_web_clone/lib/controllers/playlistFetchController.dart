import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PLayListController extends GetxController {

  CollectionReference playlistRef = FirebaseFirestore.instance.collection('playlistNames');
//  Rx<QuerySnapshot> playList = Rx<QuerySnapshot>();
  var playList = List<String>().obs;

  fetchPlayLists() async{
    QuerySnapshot playLists =await playlistRef.get();
    for(int i=0;i<playLists.docs.length;i++) {
      playList.add(playLists.docs[i].data()['name']);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPlayLists();
  }

}