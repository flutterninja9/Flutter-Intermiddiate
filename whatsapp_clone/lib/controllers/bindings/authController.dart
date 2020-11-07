import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:whatsapp_clone/views/home.dart';
import 'package:whatsapp_clone/views/rootView.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _user = Rx<User>();
  GoogleSignIn googleSignIn = GoogleSignIn();
  CollectionReference reference =
      FirebaseFirestore.instance.collection('whatsappUsers');

  String get user => _user.value?.email;

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  signInWithGoogle() async {
    try {
      GoogleSignInAccount account = await googleSignIn.signIn();
      GoogleSignInAuthentication authentication = await account.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: authentication.idToken,
          accessToken: authentication.accessToken);

      await _auth.signInWithCredential(credential);
      await reference.doc(FirebaseAuth.instance.currentUser.uid).set({
        'name': FirebaseAuth.instance.currentUser.displayName,
        'email': FirebaseAuth.instance.currentUser.email,
        'pic': FirebaseAuth.instance.currentUser.photoURL,
        'uid' : FirebaseAuth.instance.currentUser.uid
      });
      Get.offAll(HomeScreen());
      Get.rawSnackbar(title: "Success", message: "Logged In successfully!");
    } catch (e) {
      print(e.toString());
      Get.rawSnackbar(title: "Oops!", message: e.toString());
    }
  }

  signOut() async {
    googleSignIn.signOut();
    _auth.signOut();
    Get.offAll(Root());
  }
}
