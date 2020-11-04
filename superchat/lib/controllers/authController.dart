import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<User> user = Rx<User>();

  String get userInfo => user.value?.email;


  @override
  void onInit() {
    super.onInit();
    user.bindStream(auth.authStateChanges());
  }

  login() async{
    try {
      GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
      );

      UserCredential baseCred = await auth.signInWithCredential(credential);
      user.value = baseCred.user;
    }
    catch(e) {
      Get.rawSnackbar(title: "Some Error Occureed!",message: e.toString());
    }
  }

  logout() async {
    await googleSignIn.signOut();
    await auth.signOut();
  }

}