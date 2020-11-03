import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class PLayListController extends GetxController {

  CollectionReference playlistRef = FirebaseFirestore.instance.collection('playlistNames');
  CollectionReference categoryRef = FirebaseFirestore.instance.collection('shortcuts');
  CollectionReference categoryRefLiked = FirebaseFirestore.instance.collection('liked');
  CollectionReference categoryRefRecent = FirebaseFirestore.instance.collection('recent');
  final player = AudioPlayer();
  var currSong = "Play Something".obs;
  var currSongPoster = "https://images.unsplash.com/photo-1497493292307-31c376b6e479?ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80".obs;
//  Rx<QuerySnapshot> playList = Rx<QuerySnapshot>();
  var playList = List<String>().obs;
  var categoryShortCut = List<DocumentSnapshot>().obs;
  var categoryLiked = List<DocumentSnapshot>().obs;
  var categoryRecent = List<DocumentSnapshot>().obs;

  fetchPlayLists() async{
    QuerySnapshot playLists =await playlistRef.get();
    for(int i=0;i<playLists.docs.length;i++) {
      playList.add(playLists.docs[i].data()['name']);
    }
  }


  fetchCategory() async{
    QuerySnapshot categoryData =await categoryRef.get();
    for(int i=0;i<categoryData.docs.length;i++) {
      categoryShortCut.add(categoryData.docs[i]);
    }
  }

  fetchCategoryLiked() async{
    QuerySnapshot categoryDataLiked =await categoryRefLiked.get();
    for(int i=0;i<categoryDataLiked.docs.length;i++) {
      categoryLiked.add(categoryDataLiked.docs[i]);
    }
  }

  fetchCategoryRecent() async{
    QuerySnapshot categoryDataRecent =await categoryRefRecent.get();
    for(int i=0;i<categoryDataRecent.docs.length;i++) {
      categoryRecent.add(categoryDataRecent.docs[i]);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchPlayLists();
    fetchCategory();
    fetchCategoryLiked();
    fetchCategoryRecent();
  }

}