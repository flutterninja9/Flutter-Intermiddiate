import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:superchat/controllers/authController.dart';

class ChatController extends GetxController {
  var messages = List<String>().obs;
  CollectionReference reference = FirebaseFirestore.instance.collection('messages');
  Stream messageStream = FirebaseFirestore.instance.collection('messages').orderBy('created_on', descending: true).snapshots();

  sendMessages({message}) async{
    DateTime time = DateTime.now();
    print(time);
    await reference.add({
      'sentBy' : FirebaseAuth.instance.currentUser.displayName,
      'message' : message,
      'sendUID' : FirebaseAuth.instance.currentUser.uid,
      'created_on' : time,
      'pic' : FirebaseAuth.instance.currentUser.photoURL
    });
  }


}