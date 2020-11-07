import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  Stream users =
      FirebaseFirestore.instance.collection('whatsappUsers').snapshots();

  Stream chatData = FirebaseFirestore.instance.collection('whatsappChats').where('from',isEqualTo: FirebaseAuth.instance.currentUser.uid).snapshots();

  CollectionReference messageObject =
  FirebaseFirestore.instance.collection('whatsappChats');


  DocumentReference lastmsgSetObject =
  FirebaseFirestore.instance.collection('whatsappUsers').doc(FirebaseAuth.instance.currentUser.uid);
  
  sendMessage({to,message,personSent}) async{
    DateTime currTime = DateTime.now();
    await messageObject.add(
      {
        'to' : to,
        'from' : FirebaseAuth.instance.currentUser.uid,
        'message' : message,
        'created_on' : currTime,
      }
    ).then((value) => print("Sent!")).catchError((error) => Get.rawSnackbar(title: "Ooops",message: 'Can\'t send message'));
  }

  setLastSentMessage({to,message}) async{
    DateTime currTime = DateTime.now();
    await lastmsgSetObject.update(
        {
          'last_msg' : {
            to : [
              {
                to : to,
                'msg' : message
              }
            ]
          }
        }
    ).then((value) => print("Sent!")).catchError((error) => Get.rawSnackbar(title: "Ooops",message: 'Can\'t send message'));
  }

}
